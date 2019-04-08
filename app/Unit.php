<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use App\UnitRelation;

class Unit extends Model
{
    public function orderedChilds() {
        return $this->belongsToMany('App\Unit', 'unit_relations', 'parent_id', 'child_id')->withPivot('order');
    }

    public function renderChildren($type = null)
    {
        return new \Illuminate\Support\HtmlString(
            \Illuminate\Support\Facades\View::make("vendor.voyager.units.list", ['item' => $this])->render()
        );
    }

    private function flushHierarchy() {
        $childs = $this->orderedChilds()->get();
        foreach ($childs as $index => $child) {
            $child->flushHierarchy();
            //UnitsRelation::destroy($child->id);
            UnitRelation::where('child_id', $child->id)->delete();
        }
    }

    private function createHierarchyByOrder($order) {
        //dd($order);
        $current_unit_id = $this->id;
        foreach ($order as $index => $row) {
            $child_id = $row["id"];
            $relation = new UnitRelation();
            $relation->timestamps = false;
            $relation->order = $index;
            $relation->parent_id = $current_unit_id;
            $relation->child_id = $child_id;
            $relation->save();
            if (isset($row["children"])) {
                $child = Unit::where("id", $child_id)->first();
                $childOrder = $row["children"];
                $child->createHierarchyByOrder($childOrder);
            }
        }
    }

    public function reorder($order) {
        //dd($order);
        DB::beginTransaction();
        try {
            $this->flushHierarchy();
            $this->createHierarchyByOrder($order);
        } catch(\Exception $e)
        {
            dd($e);
            DB::rollback();
            return false;
        }

        DB::commit();
        return true;

    }
    

}
