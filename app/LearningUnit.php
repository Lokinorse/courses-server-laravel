<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class LearningUnit extends Model
{
    public function LearningUnits(){
        return $this->belongsToMany(LearningUnit::class, 'unit_to_unit');
    }
}
