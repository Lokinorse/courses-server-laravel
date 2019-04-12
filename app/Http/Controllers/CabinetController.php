<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Unit;
use Auth;
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
		
		//$user = Auth::user();

		//$transactions = $user->transactions()->get();
		//$balance = $user->balance;

		return view('cabinet.main', compact('units'));

	}

}
