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
        $messagesCount = $messages->total();



        $stats = (object) [
            "questions" => $messagesCount,
            "users" => ceil($messagesCount * 9.03),
            "passed" => ceil($messagesCount * 322),
        ];



    	return view('landing.main', compact('program', 'messages', 'stats'));
    }
}
