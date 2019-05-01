<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Program;
use Auth;
class CabinetController extends Controller
{
	public function __construct()
	{
		$this->middleware('auth');
	}

	public function index(Request $request)
	{
		$programs = Program::all();

		$user_courses_progress = auth()->user()->coursesProgress()->get();

		return view('cabinet.main', compact('programs', 'user_courses_progress'));
	}

}
