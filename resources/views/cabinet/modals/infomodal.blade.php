@extends("parts.modal")

@php 
    $modal = (object) json_decode(session()->get('message_modal'));
@endphp

{{-- SETTINGS --}}
@section('modal_id', 'infomodal')
@section('modal-max-height', '300px')
@section('modal-max-width', '700px')

@if (isset($modal->header))
    @section('modal_header')
        {!! $modal->header !!}
    @endsection
@endif
@if (isset($modal->content))
    @section('modal_content')
        {!! $modal->content !!}
    @endsection
@endif


@if (isset($modal->footer))
    @section('modal_footer')
        {!! $modal->footer !!}
    @endsection
@endif