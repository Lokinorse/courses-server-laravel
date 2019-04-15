<?php

namespace App\Http\Controllers;

use App\Test;
use App\TestResult;
use App\Unit;
use App\UserProgress;
use Auth;
use Illuminate\Support\Facades\DB;


use Illuminate\Http\Request;
class LearningController extends Controller
{

    public function showLesson($program_slug, $lesson_slug = null)
    {
        $program = Unit::where("slug", $program_slug)->where("unit_type", 0)->first();
        if (!$program) {
            abort(404);
        }
        
        $user = Auth::user();
        
        if (!$lesson_slug) {
            if ($user) $lesson = $user->getCurrentLesson($program->id);
            if (!isset($lesson)) $lesson = $lessons->first();
            if (!isset($lesson)) abort(404);
            return redirect($program->slug . "/" . $lesson->slug);
        } 
        
        
        
        $menu = $program->getCachedHierarchy();
        //$menu = $program->getHierarchy();
        
        $lessons = $program->getCachedLessons();
        //$lessons = $program->getLessons();

        $lesson = null;
        
        $lesson = Unit::where("slug", $lesson_slug)->where("unit_type", 3)->first();
        
        if (!$lesson) {
            abort(404);
        }
        
        $progress = collect([]);
        if ($user) {
            $progress = $user->progress()->withPivot("status")->where('program_id', $program->id)->orderBy("id")->get();
        }
        
        
        $percentProgress = 0;
        $doneCount = $progress->filter(function ($p) {
            return $p->pivot->status > 0;
        })->count();
        
        if ($doneCount > 0 && $lessons->count() > 0) {
            $percentProgress = $doneCount / $lessons->count() * 100;
        }
        
        $breadcrumbs = $lesson->getBreadcrumbs($program->id);


        return view('program.main', compact(
            'program',
            'lesson',
            'menu',
            'progress',
            'lessons',
            'percentProgress',
            'breadcrumbs'
        ));
    }


    public function showProgram($program_slug)
    {
        return view('jslp.main');
    }

    public function passUnit($program_id, $unit_id)
    {   
        
        $program = Unit::where("id", $program_id)->first();
        $unit = Unit::where("id", $unit_id)->first();
        $user = Auth::user();
        if (!$unit || !$user || !$program) abort(404);

        DB::beginTransaction();

        $progress = UserProgress::where("user_id", $user->id)->where('program_id', $program->id)->where("unit_id", $unit->id)->first();
        $progress->status = 1;
        $progress->save();


        $nextLesson = $program->nextLesson($unit_id);
        if ($nextLesson) {
            $openedUnitProgress = new UserProgress();
            $openedUnitProgress->status = 0;
            $openedUnitProgress->program_id = $program->id;
            $openedUnitProgress->unit_id = $nextLesson->id;
            $openedUnitProgress->user_id = $user->id;
            $openedUnitProgress->save();
        }
        
        DB::commit();

        return redirect($program->slug);
    }


    public function processTest($program_id, $unit_id, $test_id, Request $req) {

        $test = Test::where('id', $test_id)->first();
        $user = Auth::user();
        
        if (!$req->testresult || !$test || !$user) abort(404);
        
        $check = $test->checkTestResults($req->testresult);

        $testResult = new TestResult();
        $testResult->test_id = $test_id;
        $testResult->user_id = $user->id;
        $testResult->json_answers = json_encode($req->testresult);
        $testResult->mistakes = $check->mistakes;
        $testResult->is_passed = $check->is_passed;
        $testResult->save();

        if ($check->is_passed) {
            $this->passUnit($program_id, $unit_id);
            return response()->json($check);
        } 

        return response()->json((object) [
            "is_passed" => false, 
            "mistakes" => $check->mistakes, 
            "total_questions" => $check->answers->count()
        ]);
    }
    
}
