<template id="{{$modal_id}}">
    <div class="modal-wrapper modal-{{$modal_id}}" data-modal="{{$modal_id}}">
        <div class="modal-inner-content" style="max-height: {{$modal_max_height}}; max-width: {{$modal_max_width}}; ">
            
            <div class="modal-header">
                @if (isset($modal_header))
                    {{$modal_header}} 
                @endif
                <div data-modalclose="{{$modal_id}}"><i class="fa fa-times"></i></div>
            </div>

            @if (isset($modal_content))
                <div class="modal-content">{{$modal_content}}</div> 
            @endif
            @if (isset($modal_footer))
                <div class="modal-footer">{{$modal_footer}}</div>
            @endif
        </div>
    </div>
</template>