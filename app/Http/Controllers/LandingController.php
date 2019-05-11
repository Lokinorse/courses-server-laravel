<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

use App\Program;
use App\Message;

class LandingController extends Controller
{
    public function index() {
        $program = Program::find(1);

        
        $messages = Message::getMessages(0)->where("parent_id", 0)->orderBy('created_at', 'desc')->paginate(5);
        


        //$messagesCount = Message::getMessages(0)->count();
        
        //$messagesCount = 4643;
        $messagesCount = Message::getMessages(0)->where('deleted_at', null)->count();
        $users = ceil($messagesCount * 3.535);
        $passed = ceil($users * 58.055);


        $stats = (object) [
            "questions" => $messagesCount,
            "users" => $users,
            "passed" => $passed,
        ];



    	return view('landing.main', compact('program', 'messages', 'stats'));
    }
}
