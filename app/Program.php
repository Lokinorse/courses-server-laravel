<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use App\ProgramCourse;
use Auth;

class Program extends Model
{



    public function renderChildren($active = null)
    {
        return new \Illuminate\Support\HtmlString(
            \Illuminate\Support\Facades\View::make("vendor.voyager.programs.list", ['item' => $this, 'active' => $active])->render()
        );
    }

    public function orderedCourses()
    {
        return $this->belongsToMany('App\Course', 'program_course', 'program_id', 'course_id')->withPivot('order');
    }

    public function sortedCourses()
    {
        return $this->orderedCourses()->get()->sortByDesc(function ($item, $key) {
            return $item->id;
        })->sortBy(function ($item, $key) {
            return $item->pivot->order;
        });
    }

    private function flushHierarchy()
    {
        return ProgramCourse::where('program_id', $this->id)->delete();
    }

    private function createOrder($order)
    {
        //dd($order);
        $program_id = $this->id;
        foreach ($order as $index => $row) {
            $course_id = $row["id"];
            $relation = new ProgramCourse();
            $relation->timestamps = false;
            $relation->order = $index;
            $relation->program_id = $program_id;
            $relation->course_id = $course_id;
            $relation->save();
            if (isset($row["children"])) {
                $child = Course::where("id", $course_id)->first();
                $childOrder = $row["children"];
                $child->createOrder($childOrder);
            }
        }
    }

    public function getCurrentCourse()
    {


        $courses = $this->sortedCourses();

        $user = Auth::user();

        $user_courses_progress = $user->coursesProgress()->where('status', 0)->get();
        if (!$user || $user_courses_progress->count() == 0) return $courses->first();


        $current_course_progress = $user_courses_progress->last();

        if (!$current_course_progress) return $courses->first();

        $current_course = Course::where("id", $current_course_progress->course_id)->first();
        if (!$current_course) return $courses->first();
        return $current_course;
    }


    public function getResumeUrl()
    {
        $current_course = $this->getCurrentCourse();
        if (!$current_course) return null;
        return url($this->slug . "/" . $current_course->slug);
    }

    public function reorder($order)
    {
        //dd($order);
        DB::beginTransaction();
        try {
            $this->flushHierarchy();
            $this->createOrder($order);
        } catch (\Exception $e) {
            dd($e);
            DB::rollback();
            return false;
        }

        DB::commit();
        return true;
    }

    public function getProgramLessons()
    {
        return ProgramCourse::where("program_id", $this->id)->get()->reduce(function ($acc, $program_course) {
            $course = Course::find($program_course->course_id);
            $course->pureLessons()->each(function ($l) use (&$acc, &$course) {
                $l->course = $course;
                $acc->push($l);
            });
            return $acc;
        }, collect([]));
    }

    public function getNextLessonUrl($current_lesson_id) {
        $all_lessons = $this->getProgramLessons();
        $next_lesson = $this->getNextLesson($all_lessons, $current_lesson_id);
        if (!$next_lesson) return $this->getResumeUrl();

        return url($this->slug . "/" . $next_lesson->course->slug . "/" . $next_lesson->slug);
    }

    public function getNextLesson($lessons, $current_lesson_id)
    {
        $lesson_id_array = array_values($lessons->map(function ($l) {
            return $l->id;
        })->toArray());

        $flipped = array_flip($lesson_id_array);
        if (!isset($lesson_id_array[$flipped[$current_lesson_id] + 1])) return;
        $next_id = $lesson_id_array[$flipped[$current_lesson_id] + 1];

        if ($next_id === null) return null;
        return $lessons->first(function ($l) use ($next_id) {
            return $l->id == $next_id;
        });
    }

    public function unlockNextLesson($current_lesson_id = null)
    {

        $all_lessons = $this->getProgramLessons();
        $next_lesson = $this->getNextLesson($all_lessons, $current_lesson_id);
        $current_lesson = $all_lessons->first(function ($l) use ($current_lesson_id) {
            return $l->id == $current_lesson_id;
        });



        $current_course = $current_lesson->course;
        $next_course = null;
        if ($next_lesson) $next_course = $next_lesson->course;

        DB::transaction(function () use ($current_course, $next_course, $current_lesson, $next_lesson) {
            if ($current_course == $next_course) {
                $current_lesson->complete();
                if (isset($next_lesson)) $next_lesson->unlock();
            } else {
                $current_lesson->complete();
                $current_course->complete();
                if (isset($next_course)) $next_course->unlock();
            }
        });
        return $next_lesson;
    }
}
