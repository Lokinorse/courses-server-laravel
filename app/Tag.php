<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Tag extends Model
{
    public function index(){

    }

    public function messages() {
        return $this->belongsTo("App\Message");
    }
}

