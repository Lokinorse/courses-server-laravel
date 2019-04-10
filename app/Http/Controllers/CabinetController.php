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

		$units = Unit::where('unit_type', 0)->get();


		return view('cabinet.main', compact('units'));

	}

}
