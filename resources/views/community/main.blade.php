@extends('layouts.app')

@section('content')


@include('community.questions-preview', ["messages" => $messages, "title" => "Сообщество"])

@endsection



@section('custom-admin-script')

    @include('community.parts.admin-scripts')

@endsection 