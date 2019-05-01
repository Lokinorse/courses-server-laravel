<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class Message extends Model
{
    public function childs() {
        return $this->hasMany("App\Message", 'parent_id');
    }
    public function parent() {
        return $this->belongsTo("App\Message", 'parent_id');
    }  
    public function user() {
        return $this->belongsTo("App\User");
    }

    public function humanDiff() {
        if (!$this->created_at) return "";

        $created = new Carbon($this->created_at);
        $secondsDiff = $created->diffInSeconds();
        if ($secondsDiff < 60) return "Только что";

        return $created->locale('ru_RU')->shortRelativeDiffForHumans([
            'parts' => 3,
            'join' => ', ', // join with commas
        ]);
    }

    static function getMessages() {
        
        return Message::where('created_at', "<=", new Carbon())->orderBy('created_at', 'desc');
    }


    public function getTitle() {

        return trim($this->udemy_title);
        return trim($this->udemy_title) ? trim($this->udemy_title) : "Без темы";
    }




    public function getBodyPreview() {
        $maxLen = 200;
        $text = trim($this->udemy_text);
        $config = ['HTML.Allowed' => ''];
        $fullBody = \Stevebauman\Purify\Facades\Purify::clean($text, $config);
        if ($fullBody == "") return false;
        if (strlen($fullBody) > $maxLen) {
            return substr($fullBody, 0, $maxLen) . "...";
        }
        return $fullBody;
    } 
    public function getBody() {
        return $this->udemy_text;
    }
     
}
