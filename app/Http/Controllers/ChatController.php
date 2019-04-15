<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Message;
use App\Utils\VkCommunityApi;
use Auth;

class ChatController extends Controller
{
    public function index($destination_type, $target_id, $message_type) {

        $messages = Message::where('destination_type', $destination_type)->where('message_type', $message_type)->where('target_id', $target_id)->where('parent_id', 0)->get();


        return view("components.chat", compact('messages', 'message_type'));
    }

    public function sendMessage($destination_type, $target_id, $message_type, $parent_id = null, Request $request) {

        $user = Auth::user();
        $messageText = $request->message;
        if (!$user || !$messageText || !$destination_type || !$target_id || !$message_type) return "failure";


        $message = new Message();
        $message->destination_type = $destination_type;
        $message->target_id = $target_id;
        $message->user_id = $user->id;
        $message->text = $messageText;
        $message->parent_id = ($parent_id) ? $parent_id : 0;
        $message->message_type = $message_type;
        $message->destination_type = $destination_type;
        $message->save();


        if ($parent_id != null && $message_type == "faq") {
            $vk = new VkCommunityApi();
            $parentMessage = $message->parent()->first();
            $questedUser = $message->user()->first();
            $vkmsg = "
                Ты задал вопрос:
                $parentMessage->text
                =======
                Антон ответил на твой вопрос: 
                $messageText
            ";
            $vk->vkApi_messagesSend($questedUser->provider_user_id,  $vkmsg, array());
        }


        return "done";
    }
}
