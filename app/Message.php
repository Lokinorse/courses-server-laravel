<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Carbon\Carbon;
use Auth;
class Message extends Model
{
    use SoftDeletes;
/*     public function childs() {
        return $this->hasMany("App\Message", 'parent_id');
    }
    public function parent() {
        return $this->belongsTo("App\Message", 'parent_id');
    } */  
    public function user() {
        return $this->belongsTo("App\User");
    }

    public function answers() {
        //return $this->hasMany('App\Message', 'parent_id')->orderBy('created_at', 'asc');

        if(Auth::user() && Auth::user()->hasRole('admin'))  {
            return $this->hasMany('App\Message', 'parent_id')->orderBy('created_at', 'asc')->where('created_at', "<=", (new Carbon())->addDays(10000));
            //return Message::where('created_at', "<=", (new Carbon())->addDays($offset));
        }
        return $this->hasMany('App\Message', 'parent_id')->orderBy('created_at', 'asc')->where('created_at', "<=", new Carbon())->where('approved', 1);
        //return Message::where('created_at', "<=", new Carbon())->where('approved', 1);


        //return Message::getMessages(10000)->orderBy('created_at', 'asc')->where('parent_id', $this->id);
    }

    public function getAnswersCountAttribute()
    {
        return $this->answers->count();
    }


    public function udemy_object() {

        return $this->belongsTo("App\UdemyObject", "related_udemy_object_id");

    }

    public function getUrl() {


		if ($this->message_type == "answer") {
			$parent = Message::find($this->parent_id);
			if ($parent) {
                return route("community_question", ["question_slug" => $parent->slug]);
            } else {
                return route("community");
            }
        }

        if (trim($this->slug) != "") {
            if ($this->deleted_at) {
                return route("community"); 
            }



            return route("community_question", ["question_slug" => $this->slug]);
        } else {
            return route("community");
        }
    }

    public function lesson() {
        if (!$this->destionation_type != "lesson") return null;
        return $this->hasOne("App\Lesson", 'id', 'target_id');
        //return Lesson::where('id', $this->target_id)->first();
    }

    public function hasChangePermission() {
        $user = Auth::user();
        if (!$user) return false;
        if ($user->hasRole('admin')) return true;
        if ($this->user_id == $user->id) return true;
        return false;
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

    static function getMessages($offset = 0) {
        if(Auth::user() && Auth::user()->hasRole('admin'))  {
            return Message::where('created_at', "<=", (new Carbon())->addDays($offset));
        }
        return Message::where('created_at', "<=", new Carbon())->where('approved', 1);
    }

    public function getSlug() {
        if (trim($this->slug) != "") return $this->slug;
        return $this->id;
    }

    public function getEnglishTitle() {
        return trim($this->udemy_title);
    }
    public function getEnglishBody() {
        return trim($this->udemy_text);
    }
    public function getTitle() {
        if (trim($this->title) != "") return $this->title;
        return "[НЕДОПУСТИМО] " . trim($this->udemy_title);
        //return trim($this->udemy_title) ? trim($this->udemy_title) : "Без темы";
    }




    public function getBodyPreview() {
        $maxLen = 200;
        $text = $this->getBody();
        $config = ['HTML.Allowed' => ''];
        $fullBody = \Stevebauman\Purify\Facades\Purify::clean($text, $config);
        if ($fullBody == "") return false;
        if (strlen($fullBody) > $maxLen) {
            return substr($fullBody, 0, $maxLen) . "...";
        }
        return $fullBody;
    } 

    public function getBody() {
        $text = "[НЕДОПУСТИМО] ".trim($this->udemy_text);
        if (trim($this->text) != "") return $this->text;
        return $text;
    }
     
}
