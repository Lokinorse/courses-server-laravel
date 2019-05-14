<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

use GeneaLabs\LaravelModelCaching\Traits\Cachable;

class UdemyObject extends Model
{
    use Cachable;
}
