@extends('layouts.app')

@section('content')

@php 
$author = $question->user()->first();
$text = $question->getBody();
$avatar = $author->avatar;
@endphp 

<div class="container cabinet-room">


    <div class="community-message">
        <div class="message-heading"> 
            <div class="message-heading-ava">
                <img src="{{$avatar}}"/>
            </div>
            <div class="message-heading-text">
                <div class="author-time">
                    <span class="message-heading-author">{{$author->name}}</span>
                    <span class="message-heading-time">{{$question->humanDiff()}}</span>
                </div>
                <h1>{{$question->getTitle()}}</h1>
            </div>
        </div>
        @if ($text) 
        <p class="message-text-preview">
            {!!$text!!}
        </p>
        @endif 
    </div>
    

    
</div>



@endsection


