<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\MessageReport;
use App\User;
use App\Message;
use Carbon\Carbon;
use Auth;
use Illuminate\Support\Facades\Storage;


class CommunityController extends Controller
{

	public function index(Request $request)
	{
		$messages = Message::getMessages()->where("parent_id", 0)->orderBy('created_at', 'desc')->paginate(15);
		return view('community.main', compact('messages'));
	}

	public function question($question_id)
	{

		$question = Message::getMessages()->where('id',$question_id)->where("parent_id", 0)->first();
		if (!$question) return abort(404);

		return view('community.question', compact('question'));
	}

	public function upload_image($owner_type, Request $request) {

		$file = $request->file('file');
		$user = Auth::user();
		if ($owner_type != "message" || !$file || !$user) return abort(404);

		$filename = md5(time()). "." . $file->getClientOriginalExtension();
		$path = $owner_type . "/" . md5($user->id);

		Storage::cloud()->putFileAs($path,  $file, $filename);

		$url = Storage::cloud()->url($path . "/" . $filename);

		return json_encode(['location' => $url ]);
	}


	public function save_message($message_id, Request $request) {
		$content =  $request->content;
		$title =  $request->title;

		$message = Message::find($message_id);
		$user = Auth::user();
		if (!$message || !$user) return abort(404);
		if (!$message->hasChangePermission()) return abort(403); 
		
		$message->text = $content;
		$message->title = $title;
		$message->save();
		return "done";

	}



	public function delete_message($message_id) {
		$message = Message::find($message_id);
		if (!$message->hasChangePermission()) return abort(403); 
		$message->delete();
		return "done";

	}


	public function report_message($message_id, Request $request) {
		$user = Auth::user();
		$reason = $request->reason;

		if (!$user) return abort(403);

		$report = new MessageReport();
		$report->user_id = $user->id;
		$report->message_id = $message_id;
		$report->reason = trim($reason);
		$report->save();
		return "done";

	}

	public function change_message_destination($message_id, Request $request) {

		$new_lesson_id = $request->lesson_id;
		$message = Message::find($message_id);
		if (!$message->hasChangePermission()) return abort(403); 

		if (!isset($new_lesson_id)) {
			$message->destination_type = 'program';
			$message->target_id  = 1;
		} else {
			$message->destination_type = 'lesson';
			$message->target_id  = $new_lesson_id;
		}

		$message->save();
		return redirect()->route('community_question', ["question_id" => $message_id]);

	}

	public function approve_message($message_id) {
		$message = Message::find($message_id);
		if (!$message->hasChangePermission()) return abort(403); 
		$message->approved = !$message->approved;
		$message->save(); 
	}

	public function skin_user($user_id) {
		if (!Auth::user()->hasRole('admin')) return abort(404);

		$user = User::find($user_id);
		if (!$user) return abort(500);

		Auth::login($user, true);
	}
}
