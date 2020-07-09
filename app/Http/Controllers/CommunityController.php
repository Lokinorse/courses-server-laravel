<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\MessageReport;
use App\User;
use App\Message;
use App\Tag;
use Carbon\Carbon;
use Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;



class CommunityController extends Controller
{

	public function index(Request $request)
	{
		$request->flash();
		$days_next = $request->daysnext;
		if (!$days_next) $days_next = 0;

		if ($request->search) {

			$messages = Message::getMessages($days_next)
			->with(['lesson', 'lesson.course', 'lesson.course.program', 'user', 'answers'])
			->where("title", 'like', "%".$request->search."%")
			->where("parent_id", 0)
			->orderBy('created_at', 'desc')->paginate(10);

		} else {
			$messages = Message::getMessages($days_next)
			->with(['lesson', 'lesson.course', 'lesson.course.program', 'user', 'answers'])
			->where("parent_id", 0)
			->orderBy('created_at', 'desc')
			->paginate(10);
		}



		return view('community.main', compact('messages'));
	}

	public function all_tags(){
		$tags = Tag::all();
		return view('community.all-tags', compact('tags'));
	}


	public function new_question(Request $request) {
	
		return view('community.new-question');
	}




	public function question($question_slug)
	{
		//dd($question_slug);
		$question = Message::getMessages(100)
		->with(['lesson', 'lesson.course', 'lesson.course.program', 'user', 'answers'])
		->where('slug', $question_slug)
		->where("parent_id", 0)->first();

		if (Is_Numeric($question_slug) && !$question)  $question = Message::getMessages()
		->with(['lesson', 'lesson.course', 'lesson.course.program', 'user', 'answers'])
		->where('id', $question_slug)
		->where("parent_id", 0)
		->first();
		
		//dd(Message::getMessages()->where('slug', $question_slug)->get());
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
		//dd("test");

		$content =  $request->content;
		$title =  $request->title;
/* 		$tags = $request->tags; */
		$tagsArr = explode(",",$request->tags);
		$user = Auth::user();

		if ($message_id == "new") {
			$message = new Message();
			$message_id;
			$message->user_id = $user->id;
			$message->destination_type = $request->destination_type; 
			$message->target_id = $request->target_id; 
			$parent_id = $request->parent_id;
			if (!isset($parent_id)) $parent_id = 0;
			$message->parent_id = $parent_id; 
			$message->message_type = $request->message_type; 
			$message->approved = 1; 
		} else {
			$message = Message::find($message_id);
		}

		if (!$message || !$user) return abort(404);
		if (!$message->hasChangePermission()) return abort(403); 
		
		$message->text = $content;
		$message->title = $title;
		if (trim($title) != "") {
			$message->slug = Str::slug($title, '-');
		}
		$message->save();
		//saving tags + creating relations between posts and tags:
		foreach ($tagsArr as $singleTag) {
			$tag = new Tag();
			$tag->name = $singleTag;
			$tag->save();
			$message->tags()->attach($tag);
		}

		if (isset($request->redirect)) {
			return redirect($message->getUrl());
		}
		return $message->getUrl();
		
	}
	
	


	public function delete_message($message_id) {
		$message = Message::find($message_id);
		if (!$message) return $message->getUrl();
		if (!$message->hasChangePermission()) return abort(403); 
		
		$message->delete();

		return $message->getUrl();

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
		return redirect()->route('community_question', ["question_slug" => $message->slug]);

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
