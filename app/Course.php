<?php

namespace App;

use App\Lesson;
use App\UserCoursesProgress;
use Auth;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Course extends Model
{

    public function renderChildren($active)
    {
        return new \Illuminate\Support\HtmlString(
            \Illuminate\Support\Facades\View::make("vendor.voyager.courses.list", ['item' => $this, 'active' => $active])->render()
        );
    }

    public function orderedLessons()
    {
        return $this->belongsToMany('App\Lesson', 'course_lesson', 'course_id', 'lesson_id')->withPivot('order');
    }

    public function sortedLessons()
    {
        return $this->orderedLessons()->get()->sortByDesc(function ($item, $key) {
            return $item->id;
        })->sortBy(function ($item, $key) {
            return $item->pivot->order;
        });
    }

    public function pureLessons() {
        return $this->sortedLessons()->filter(function ($l) {
            return $l->lesson_type != 'divider';
        });
    }

    private function flushHierarchy()
    {
        return CourseLesson::where('course_id', $this->id)->delete();
    }

    private function createOrder($order)
    {
        //dd($order);
        $course_id = $this->id;
        foreach ($order as $index => $row) {
            $lesson_id = $row["id"];
            $relation = new CourseLesson();
            $relation->timestamps = false;
            $relation->order = $index;
            $relation->course_id = $course_id;
            $relation->lesson_id = $lesson_id;
            $relation->save();
            if (isset($row["children"])) {
                $child = Lesson::where("id", $lesson_id)->first();
                $childOrder = $row["children"];
                $child->createOrder($childOrder);
            }
        }
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

    public function userProgress() {
        $user = Auth::user();
        $lessons = $this->sortedLessons();
        $lesson_ids = $lessons->map(function($lesson) {
            return $lesson->id;
        });
        if (!$user || !$lessons) return null;
        return $user->lessonsProgress()->whereIn('lesson_id', $lesson_ids);
    }




    public function getCurrentLesson()
    {

        $lessons = $this->pureLessons();

        $user = Auth::user();
                
        $last_lesson_progress = $this->userProgress()->where('status', 0)->orderBy('id')->orderBy('created_at')->first();
        

        if (!$user || !$last_lesson_progress) return $lessons->first();


        $current_course = Lesson::where("id", $last_lesson_progress->lesson_id)->first();

        if (!$current_course) return $lessons->first();
        return $current_course;
    }

    public function nextLesson()
    {
        $current_lesson = $this->getCurrentLesson();
        $lessons = $this->pureLessons();

        $lesson_id_array = array_values($lessons->map(function($l) {return $l->id; })->toArray());
        
        $flipped = array_flip($lesson_id_array);
        if (!isset($lesson_id_array[$flipped[$current_lesson->id]+1])) return;
        $next_id = $lesson_id_array[$flipped[$current_lesson->id]+1];

        if ($next_id === null) return null;
        return $lessons->first(function($l) use ($next_id) {
            return $l->id == $next_id;
        });
    }



    public function unlock()
    {
        $user = Auth::user();
        if (!$user) {
            throw new \Exception("Пользователь не залогинен");
        }
        if (UserCoursesProgress::where('user_id', $user->id)->where('course_id', $this->id)->first()) {
            return;
        }
        $progress = new UserCoursesProgress();
        $progress->user_id = $user->id;
        $progress->course_id = $this->id;
        $progress->status = 0;
        $progress->save();
        $first_lesson = $this->sortedLessons()->first();
        $first_lesson->unlock();
    }

    public function complete()
    {
        $user = Auth::user();
        if (!$user) {
            throw new \Exception("Пользователь не залогинен");
        }

        $progress = UserCoursesProgress::where('user_id', $user->id)->where('course_id', $this->id)->first();
        if (!$progress) $progress = new UserCoursesProgress();
        $progress->user_id = $user->id;
        $progress->course_id = $this->id;
        $progress->status = 1;
        $progress->save();
    }
}
