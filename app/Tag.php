<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Tag extends Model
{
    public function index(){

    }

    public function messages() {
        return $this->belongsTo("App\Message");
    }

    public static function approve($tagId){
        $approve = DB::table('tags')
              ->where('id', $tagId)
              ->update(['approved' => 1]);
    }
}

