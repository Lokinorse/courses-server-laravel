<?php

namespace App\Http\Controllers;

use App\Test;
use App\TestResult;

use Auth;
use Illuminate\Support\Facades\DB;

use App\Course;
use App\Lesson;
use App\Program;

use Illuminate\Http\Request;


class LearningController extends Controller
{

    public function showLesson($program_slug, $course_slug = null, $lesson_slug = null)
    {
        $program = Program::where("slug", $program_slug)->first(); 
        
        if (!$program) {
            abort(404);
        }

        if (!$course_slug) {
            return redirect($program->getResumeUrl());
        }

        $course = Course::where("slug", $course_slug)->first();
        if (!$course || !$program) {
            abort(404);
        }

        $user = Auth::user();

        if (!$lesson_slug) {
            $lesson = $course->getCurrentLesson();
            if (!isset($lesson)) abort(404);
            if (!$lesson->slug) abort(404);
            return redirect($program_slug . "/" . $course->slug . "/" . $lesson->slug);
        }

        $sorted_lessons = $course->sortedLessons();

        $current_lesson = Lesson::where("slug", $lesson_slug)->first();

        if (!$current_lesson) {
            abort(404);
        }

        $lesson_ids = $sorted_lessons->map(function($lesson) {
            return $lesson->id;
        });

        $progress = collect([]);
        if ($user) $progress = $user->lessonsProgress()->whereIn('lesson_id', $lesson_ids)->get();

        $percentProgress = 0;
        $doneCount = $progress->filter(function ($p) {
            return $p->status > 0;
        })->count();

        $pureLessonsCount = $course->pureLessons()->count();
        if ($doneCount > 0 && $pureLessonsCount > 0) {
            $percentProgress = $doneCount / $pureLessonsCount * 100;
        }


        return view('learning.main', compact(
            'course',
            'current_lesson',
            'program',
            'progress',
            'sorted_lessons',
            'percentProgress'
            //'breadcrumbs'
        ));
    }


    public function showProgram($program_slug)
    {
        return view('jslp.main');
    }

    public function unlockNextLesson($program_id, $lesson_id)
    {

        $program = Program::find($program_id);

        $user = Auth::user();

        if (!$user || !$program) abort(404);


        //PASS VALIDATION HERE

        $unlocked_lesson = null;
        DB::transaction(function () use ($program, $lesson_id, &$unlocked_lesson) {
            $unlocked_lesson = $program->unlockNextLesson($lesson_id);
        });

        if ($unlocked_lesson) {
            return redirect($program->getResumeUrl());
        }

        $modal = [
            "header" => "Я горжусь тобой!",
            "content" => 
                "Поздравляю, ты сделал это!
                <br/>
                Программа " . $program->name. " была успешно пройдена.
                <br/>
                В личном кабинете ты всегда можешь получить все пройденные тобой материалы.
            ",
        ];

        return redirect('cabinet')->with("message_modal", json_encode($modal));
    }




    public function processTest($program_id, $lesson_id, Request $req)
    {

        $test = Lesson::find($lesson_id);
        $user = Auth::user();

        if (!$req->testresult || !$test || !$user) abort(404);

        $check = $test->checkTestResults($req->testresult);

        $testResult = new TestResult();
        $testResult->lesson_id = $lesson_id;
        $testResult->user_id = $user->id;
        $testResult->json_answers = json_encode($req->testresult);
        $testResult->mistakes = $check->mistakes;
        $testResult->is_passed = $check->is_passed;
        $testResult->save();

        if ($check->is_passed) {
            $program = Program::find($program_id);
            $program->unlockNextLesson($lesson_id);
            return response()->json($check);
        }

        return response()->json((object)[
            "is_passed" => false,
            "mistakes" => $check->mistakes,
            "total_questions" => $check->answers->count()
        ]);
    }
}
