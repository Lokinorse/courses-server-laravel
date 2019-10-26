<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Program;
use Auth;
use Hash;
use App\Message;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\ImageManagerStatic as Image;
use Validator;

use App\Transaction;
use Carbon\Carbon;

class CabinetController extends Controller
{
	public function __construct()
	{
        $this->middleware(['auth', 'verified']);
		
	}

	public function index(Request $request)
	{


		$programs = Program::all();

		$user_courses_progress = auth()->user()->coursesProgress()->get();

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

		return view('cabinet.main', compact('programs', 'user_courses_progress', 'messages'));
	}



	public function profile()
	{
		return view('cabinet.profile.settings');
	}

	public function settings()
	{
		return view('cabinet.profile.settings');
	}

	public function transactions()
	{
		$user = Auth::user();
		if (!$user) return abort(404);
		$transactions = $user->transactions()->orderBy('id', 'desc')->where('status', 1)->get();
		return view('cabinet.profile.transactions', ['transactions' => $transactions]);
	}	

	public function pay()
	{
		$user = Auth::user();
		if (!$user) return abort(404);

		$current_transaction = $user->transactions()->where('status', 0)->where('is_real', 1)->first();
		if (!$current_transaction) {
			$current_transaction = new Transaction();
			$current_transaction->user_id = $user->id;
			$current_transaction->status = 0;
			$current_transaction->is_real = 1;
			$current_transaction->description = "Пополнение баланса";
			$current_transaction->value = 0;
			$current_transaction->promo_id = null;
		}
		$current_transaction->created_at = new Carbon();
		$current_transaction->updated_at = new Carbon();
		$current_transaction->save();


		$program = Program::find(1);
		//notification_type&operation_id&amount&currency&datetime&sender&codepro&notification_secret&label




		return view('cabinet.profile.pay', compact('current_transaction', 'program'));
	}





	public function profile_save(Request $request)
	{
		$validator = Validator::make($request->all(), [
			'first_name' => 'required|min:2'
		]);

		if ($validator->fails()) {
			return redirect()->route('cabinet_profile')
				->withErrors($validator)
				->withInput();
		}

		$user = Auth::user();
		if (!$user) return abort(403);
		$user->first_name = $request->first_name;
		$user->last_name = $request->last_name;
		$user->save();
		return redirect()->route('cabinet_profile');
	}

	public function profile_password_change(Request $request)
	{

		$validator = Validator::make($request->all(), [
			'old_password' => 'required_with:password',
			'password' => 'required|confirmed',
			'password_confirmation' => 'required',
		]);

		if ($validator->fails()) {
			return redirect()->route('cabinet_profile')
				->withErrors($validator)
				->withInput();
		}

		$user = Auth::user();
		if (!$user) return abort(403);


		$old_password = $request->old_password;
		$password = $request->password;
		$password_confirmation = $request->password_confirmation;

		//$user->password = Hash::make("iq9VT21j");
		//$user->save();	
		if (Hash::check($old_password, $user->password)) {
			$user->password = Hash::make($password);
			$user->save();
			$modal = [
				"content" => "Пароль успешно изменен",
			];
		} else {
			$validator->errors()->add('current_password', 'Текущий пароль неверный');
			return redirect()->route('cabinet_profile')
				->withErrors($validator)
				->withInput();
		}
		return redirect()->route('cabinet_profile')->with("message_modal", json_encode($modal));
	}

	public function cabinet_change_avatar(Request $request)
	{
		$validator = Validator::make($request->all(), [
			'avatar' => 'image',
		]);

		if ($validator->fails()) {
			return redirect()->route('cabinet_profile')
				->withErrors($validator)
				->withInput();
		}

		$ava = $request->file('avatar');

		$user = Auth::user();
		if (!$user) return abort(404);


		$image_normal = Image::make($ava)->widen(800, function ($constraint) {
			$constraint->upsize();
		});
		$image_thumb = Image::make($ava)->fit(200);
		$image_normal = $image_normal->encode('jpg');
		$image_thumb = $image_thumb->encode('jpg');

		$ext =  $ava->getClientOriginalExtension();
		$name  = $ava->getClientOriginalName();
		$fullname = basename($name, "." . $ext) . ".jpg";


		$thump_path = 'users/' . $user->id . '/thumbs/' . $fullname;



		Storage::cloud()->put('users/' . $user->id . '/' . $fullname, (string)$image_normal);
		$thumb_path = Storage::cloud()->put($thump_path, (string)$image_thumb);

		$url = Storage::cloud()->url($thump_path);


		$user->avatar = $url;
		$user->save();
		return redirect()->route('cabinet_profile');
	}
}
