@php 
    $modal = (object) json_decode(session()->get('message_modal'));
@endphp

@component('components.modal')
    @slot('modal_id', 'infomodal')
    @slot('modal_max_height', '300px')
    @slot('modal_max_width', '700px')

    @if (isset($modal->header))
        @slot('modal_header')
            {!! $modal->header !!}
        @endslot
    @endif

    @if (isset($modal->content))
        @slot('modal_content')
            {!! $modal->content !!}
        @endslot
    @endif

    @if (isset($modal->footer))
        @slot('modal_footer')
            {!! $modal->footer !!}
        @endslot
    @endif
@endcomponent






