<ol class="dd-list">



@foreach ($menu->all() as $menuItem)

    @php
        $isActive = null;
        $styles = null;
        
        $child = $menuItem->first();
        
        $childMenu = $menuItem->last();


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
        <div class="dd-handle">
            <i class="{{$icon}}"></i>
            <span>{{ $child->id }} {{$unit_type_text}} {{ $child->name }} {{ $child->pivot->order }}</span>
        </div>
        @if (isset($childMenu) && $childMenu->count() > 0)
            @include('program.lesson-menu', ['menu' => $childMenu])
        @endif
    </li>


@endforeach

</ol>