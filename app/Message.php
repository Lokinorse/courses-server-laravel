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
     
}
