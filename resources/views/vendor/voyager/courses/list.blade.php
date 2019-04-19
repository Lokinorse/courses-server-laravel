<ol class="dd-list">

@php
    $items = $item->sortedLessons();
@endphp



@foreach ($items as $child)

    @php
        $isActive = null;
        $styles = null;
       
    @endphp

        <li class="dd-item" data-id="{{ $child->id }}">
        <div class="pull-right item_actions">
            <div class="btn btn-sm btn-danger pull-right content_item_delete" data-id="{{ $child->id }}">
                <i class="voyager-trash"></i> {{ __('voyager::generic.delete') }}
            </div>
            <a href="{{url('admin/lessons/'.$child->id.'/edit')}}" class="btn btn-sm btn-primary pull-right edit">
                <i class="voyager-edit"></i> {{ __('voyager::generic.edit') }}
            </a>
        </div>
        <div class="dd-handle">
            <i class="voyager-book"></i>
            <span>{{ $child->pivot->order }} - {{ $child->name }} </span>
        </div>

    </li>


@endforeach

</ol>