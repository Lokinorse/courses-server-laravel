<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Unit;

class CabinetController extends Controller
{
	public function __construct()
	{
		$this->middleware('auth');
	}

	public function index(Request $request)
	{
		//$request->user()->authorizeRoles(['admin', 'student', 'teacher']);

		$unit = Unit::first();


		return view('cabinet.main', ["unit" => $unit]);

	}

}
