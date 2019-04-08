
@php

    $items = $unit->orderedChilds()->get()->sortByDesc(function ($item, $key) {
        return $item->id;
    })->sortBy(function ($item, $key) {
        return $item->pivot->order;
    });

@endphp



@foreach ($items as $child)

    @php
        $isActive = null;
        $styles = null;
               

        switch ($child->unit_type) {
            case 1:
                # "1": "Курс",
                $icon = "voyager-book";
                $unit_type_text = "Курс";
                break;
            case 2:
                # "2": "Глава",
                $icon = "voyager-folder";
                $unit_type_text = "Глава";
                break;
            case 3:
                # "3": "Урок"
                $icon = "voyager-file-text";
                $unit_type_text = "Урок";
                break;
            default:
                $icon = "voyager-study";
                $unit_type_text = "Программа";
                break;
        }


        
    @endphp

    <a class="chapter-toggler" data-toggle="collapse" href="#chapter{{$child->id}}" role="button" aria-expanded="true" aria-controls="collapseExample">
        <span class="fa fa-list" aria-hidden="true"></span>{{$child->name}}
    </a>
    <div class="collapse nav-chapter-list-wrapper show" id="child{{$child->id}}">
        <div class="nav flex-column nav-pills nav-chapter-list" id="" >
            @include('cabinet.hierarchy', ["unit" => $child]) 
        </div>              
    </div>



@endforeach