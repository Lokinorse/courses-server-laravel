<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Plan extends Model
{
    public function getCostStringAttribute()
    {
        return number_format($this->cost, 0, '.', ' ');
    }

    public function getDiscountedCostAttribute()
    {
        if (!$this->discount) return $this->getCostStringAttribute();
        return $this->cost - ($this->cost * ($this->discount/100));
    }

    public function getDiscountedCostStringAttribute()
    {
        if (!$this->discount) return $this->getCostStringAttribute();
        return number_format($this->discounted_cost, 0, '.', ' ');
    }
}
