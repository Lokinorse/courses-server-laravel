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

    public function test() {
        return $this->hasOne('App\Test');
    }

    public function renderChildren($active)
    {
        return new \Illuminate\Support\HtmlString(
            \Illuminate\Support\Facades\View::make("vendor.voyager.units.list", ['item' => $this, 'active' => $active])->render()
        );
    }



    public function getHierarchy()
    {
        return $this->orderedChilds()->get()->sortByDesc(function ($item, $key) {
            return $item->id;
        })->sortBy(function ($item, $key) {
            return $item->pivot->order;
        })->map(function($unit) {
            return collect([$unit,$unit->getHierarchy()]);
        });
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

    public function parents() {
        return $this->belongsToMany('App\Unit', 'unit_relations', 'child_id', 'parent_id');
    }

    public function getLessons() {
        return $this->getHierarchy()->flatten()->filter(function ($unit) {
            return $unit->unit_type == 3;
        });
    }

    //Запускается в рамках программы
    public function nextLesson($prev_unit_id) {
        $lessons = $this->getLessons();
        $reduceNext = $lessons->reduce(function($result, $item) use ($prev_unit_id) {
            $get_this = $result[0];
            if (!$get_this && $item->id == $prev_unit_id) $result[0] = true;
            if ($get_this) {
                $result[0] = false;
                $result[1] = $item;
            }
            return $result;
        }, [false, null]);
        $next_lesson = $reduceNext[1];
        return $next_lesson;
    }

    public function getBreadcrumbs($program_id, $path = []) {

        $parents = $this->parents()->get();

        if ($parents->count() < 1) return $path; 
        
        //Если родитель один, добавляем его к текущему path, конкатинируем пути
        if ($parents->count() == 1) {
            $direct_parent = $parents->first();
            $path[] = $direct_parent->id;
            return $direct_parent->getBreadcrumbs($program_id, $path); 
        }

        //Если в конце идет вилка из нескольких родителей
        if ($parents->count() > 1) {
            $path[] = $program_id; 
            return $path;
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


    public function getStatus($progress) {
        $lesson = $this;

        $status = -1; //По умолчанию открытый
        $currentProgress = $progress->first(function ($value, $key) use ($lesson) {
            return $value->id == $lesson->id;
        });



        //Закрытый - -3
        if (!$lesson->unlocked) {
            $status = -3;
        }

        //Если у пользователя есть прогресс по этому уроку - ставим этот прогресс в качестве статуса
        if ($currentProgress) $status = $currentProgress->pivot->status;

        //Если у пользователя есть прогресс (например урок открыт) но урок недоделан - ставим недоделанность
        if ($currentProgress && !$lesson->completed) $status = -2;



        
        return $status;


    }
    

}
