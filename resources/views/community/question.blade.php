@extends('layouts.app')

@section('content')

@php 
$author = $question->user()->first();
$text = $question->getBody();
@endphp 

<div class="container cabinet-room">

    {{-- @include("community.admin.question-panel", ["msg" => $question]) --}}
    <div class="new-question-wrapper">
        <a href="{{ route('community') }}" class="main-button">← К ВОПРОСАМ</a>
    </div>
    <div class="community-message">
        <div class="message-heading"> 
            @include('community.parts.user-ava', ["user" => $author])
            <div class="message-heading-text">
                <div class="author-time">
                    <span class="message-heading-author">{{$author->name}}</span>
                    <span class="message-heading-time">{{$question->humanDiff()}}</span>
                    @php 
                        $lesson = $question->lesson(); 
                    @endphp 
                    @if ($lesson)
                        <object class="related-lesson">
                            К уроку
                            <a href="{{$lesson->getUrl()}}">{{$lesson->name}}</a>
                        </object>
                    @endif
                </div>
                @component('components.admin-only')
                    {{$question->getEnglishTitle()}}
                @endcomponent
                <h1 data-questiontitle="{{$question->id}}">{{$question->getTitle()}}</h1>
            </div>
        </div>
        @component('components.admin-only')
            {!!$question->getEnglishBody()!!}
        @endcomponent
        @if ($text) 
        <div class="message-text-preview" data-editorid="{{$question->id}}">
            {!!$text!!}
        </div>
        <div class="message-text-editor"></div>


        @endif 
        @include('community.actions.edit-message', ["msg" => $question])
    </div>

    @php
        $answers = $question->answers()->get();
    @endphp
    @if ($answers->count()>0) 
        <h3>Ответы</h3>
        <div class="community-answers">
            @php
                //dd($question->childs());   
            @endphp
            @foreach ($answers as $answer) 
                @php 
                $author = $answer->user()->first();
                $avatar = $author->getFallbackAva();
                @endphp 
                
                <div class="community-message">
                    <div class="message-heading"> 
                        @include('community.parts.user-ava', ["user" => $author])
                        <div class="message-heading-text">
                            <div class="author-time">
                                <span class="message-heading-author">{{$author->name}}</span>
                                <span class="message-heading-time">{{$answer->humanDiff()}}</span>
                            </div>
                        </div>
                    </div>
                    @component('components.admin-only')
                        {!!$answer->getEnglishBody()!!}
                    @endcomponent
                    <div class="message-text-preview" data-editorid="{{$answer->id}}">
                        {!!$answer->getBody()!!}
                    </div>
                    @include('community.actions.edit-message', ["msg" => $answer])
                </div>
                
            @endforeach

        </div>
    @endif

    <div class="row">
        <div class="col-md-12">
            <h1 class="program-name">Ответить</h1>
        </div>
    </div>

    @include('community.parts.new-message-wrapper', [
        "message" => [
            "destination_type" => "question",
            "target_id" => $question->id,
            "parent_id" => $question->id,
            "message_type" => "answer",
            "message_id" => "new",
        ]
    ])
    
</div>


@endsection


@section('custom-admin-script')


<link href="{{asset('/plugins/chosen/chosen.min.css')}}" rel="stylesheet" />
<script src="{{asset('/plugins/chosen/chosen.jquery.min.js')}}"></script>


<script>
    
    $(".js-select-lesson").chosen({no_results_text: "Oops, nothing found!"}); 
</script>
@include('community.parts.admin-scripts')


@endsection 

