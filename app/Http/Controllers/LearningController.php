<?php

namespace App\Http\Controllers;

use App\Unit;
use Auth;

class LearningController extends Controller
{
	public function __construct()
	{
		$this->middleware('auth');
	}

    public function showLesson($program_slug, $lesson_slug = null)
    {
        $program = Unit::where("slug", $program_slug)->where("unit_type", 0)->first();
        if (!$program) {
            abort(404);
        }

        $user = Auth::user();

        $menu = $program->getHierarchy();

        $lessons = $menu->flatten()->filter(function ($unit) {
            return $unit->unit_type == 3;
        });

        if (!$lesson_slug) {
            $lesson = $lessons->first();
        } else {
            $lesson = Unit::where("slug", $lesson_slug)->where("unit_type", 3)->first();
        }
        if (!$lesson) {
            abort(404);
        }

        $progress = collect([]);
        if ($user) {
            $progress = $user->progress()->withPivot("status")->where('program_id', $program->id)->orderBy("id")->get();
        }

        if (!$lesson_slug) {
            return redirect($program->slug . "/" . $lesson->slug);
        }

        $percentProgress = 0;
        if ($progress->count() > 0 && $lessons->count() > 0) {
            $percentProgress = $progress->count() / $lessons->count() * 100;
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
}
