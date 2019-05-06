@php 

    $videoURL = null;
    if (isset($current_lesson->video)) {
        $video_object = json_decode($current_lesson->video);
        if (isset($video_object[0])) {
            $link = $video_object[0]->download_link;
            $videoURL = Storage::url($link);
        }
    }

    $content = $current_lesson->description;
    if (trim($content) == "") $content = null;


@endphp


@switch($currentLessonStatus) 
    @case(-1)
    <div class="lesson-pane">
        <h5>Открытый урок</h5>
        <div class="lesson-pane-content">
            Урок открыт всем для ознакомления. 
            <br/>
            Однако, чтобы пройти его, нужно пройти предшествующие уроки. 
            <br/>
            @if (!Auth::user())
                Для начала стоит авторизоваться на платформе.
            @endif
        </div>
        <div class="lesson-pane-footer">
            @if (Auth::user())
                <a class="main-button" href="{{$program->getResumeUrl()}}">Перейти к текущему уроку</a>
            @else 
                <a href="{{route('login')}}" class="main-button">Войти</a>
                <a class="animated-button" href="{{ route('oauth', ['provider'=>'vkontakte']) }}">
                    <img src="{{asset('img/vk_logo.png')}}"/>
                    Войти с помощью Вконтакте
                </a>
            @endif
        </div>
    </div>
    @break
    @case(0)
        <div class="lesson-pane">
            <h5>Текущее задание</h5>
            <div class="lesson-pane-content">
                Чтобы получить доступ к следующим заданиям, необходимо выполнить это.
            </div>
        </div>
    @break
    @case(1)
        <div class="lesson-pane">
            <h5>Успех! Двигайся дальше</h5>
            <div class="lesson-pane-content">
                Это задание уже выполнено. Переходи к следующему заданию и продолжай в том же духе!
            </div>
            <div class="lesson-pane-footer">
                <a class="main-button" href="{{$program->getNextLessonUrl($current_lesson->id)}}">К следующему уроку</a>
                <a class="main-button" href="{{$program->getResumeUrl()}}">К текущему уроку</a>
            </div>
        </div>
    @break
    @case(2)
        <div class="lesson-pane">
            <h5>Успех! Двигайся дальше</h5>
            <div class="lesson-pane-content">
                Это задание уже выполнено и проверено
            </div>
            <div class="lesson-pane-footer">
                <a class="main-button" href="{{$program->getNextLessonUrl($current_lesson->id)}}">Перейти к следующему уроку</a>
            </div>
        </div>
    @break
    @case(3)
        <div class="lesson-pane">
            <h5>Ожидает проверки</h5>
            <div class="lesson-pane-content">
                Это задание ожидает проверки
            </div>
        </div>
    @break
    @default
@endswitch



@if ($videoURL) 
<div class="lesson-pane">
        <h5>Видео</h5>
        <div class="lesson-pane-content">    
            <video src="{{$videoURL}}" controls></video>
        </div>
    </div>
@endif

@component('learning.components.next-step')
    @slot('current_lesson_status', $currentLessonStatus)
    @slot('current_lesson', $current_lesson)
    @slot('course', $course)
    @slot('program', $program)
@endcomponent

@if ($content)
<div class="lesson-pane">
    <h5>Материалы к уроку</h5>
    <div class="lesson-pane-content">
        {!! $content !!}
    </div>    
</div>
@endif

@include("learning.modals.testmodal")

