@extends('layouts.app')
@section('content')
@php 
$title = $tagInstance->name;
@endphp
<div class="container cabinet-room">

    <div class="row">
        <div class="col-md-12">
        <h1 class="program-name">Все посты по тегу {{$tagInstance->name}}</h1>
        @include('community.questions-preview', ["messages" => $messagesByTag, "title" => "Вопросы по тегу  $title"])
        </div>
    </div>

</div>



@endsection

