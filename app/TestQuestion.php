<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TestQuestion extends Model
{
    public function answers() {
        return $this->hasMany("App\TestAnswer");
    }
}
