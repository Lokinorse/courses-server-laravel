<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Message;
use Carbon\Carbon;

class CommunityController extends Controller
{

	public function index(Request $request)
	{
		$messages = Message::getMessages()->paginate(15);
		return view('community.main', compact('messages'));
	}

	public function question($question_id)
	{

		$question = Message::getMessages()->where('id',$question_id)->first();
		if (!$question) return abort(404);

		return view('community.question', compact('question'));
	}
}
