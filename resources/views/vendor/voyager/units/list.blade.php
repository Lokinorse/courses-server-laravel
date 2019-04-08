<ol class="dd-list">

@php

    $items = $item->orderedChilds()->get()->sortByDesc(function ($item, $key) {
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

        <li class="dd-item" data-id="{{ $child->id }}">
        <div class="pull-right item_actions">
            <div class="btn btn-sm btn-danger pull-right content_item_delete" data-id="{{ $child->id }}">
                <i class="voyager-trash"></i> {{ __('voyager::generic.delete') }}
            </div>
            <a href="{{url('admin/units/'.$child->id.'/edit')}}" class="btn btn-sm btn-primary pull-right edit">
                <i class="voyager-edit"></i> {{ __('voyager::generic.edit') }}
            </a>
        </div>
        <div class="dd-handle">
            <i class="{{$icon}}"></i>
            <span>{{ $child->id }} {{$unit_type_text}} {{ $child->name }} {{ $child->pivot->order }}</span>
        </div>

        @include('vendor.voyager.units.list', ['item' => $child])

    </li>


@endforeach

</ol>