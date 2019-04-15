@php 
/*     $videos = json_decode($lesson->videos);
    $videoURL = null;
    if (isset($videos[0])) $videoURL = url("storage/".json_decode($lesson->videos)[0]); */

    $content = $lesson->description;
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
                <a class="main-button" href="{{url($program->slug)}}">Перейти к текущему уроку</a>
            @else 
                <a class="main-button" href="{{route('oauth', ["vkontakte"])}}">Авторизоваться</a>
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
                <a class="main-button" href="{{url($program->slug)}}">Перейти к следующему уроку</a>
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
                <a class="main-button" href="{{url($program->slug)}}">Перейти к следующему уроку</a>
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



@if ($lesson->youtube_video_id) 
<div class="lesson-pane">
        <h5>Видео</h5>
        <div class="lesson-pane-content">    
            <iframe class="youtube-video" height="415" src="https://www.youtube-nocookie.com/embed/{!! trim($lesson->youtube_video_id) !!}?rel=0&showinfo=0&modestbranding=1" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
        </div>
    </div>
@endif

@component('program.components.next-step')
    @slot('current_lesson_status', $currentLessonStatus)
    @slot('current_lesson', $lesson)
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

@include("program.modals.testmodal")


@include("program.communication", ['lesson' => $lesson])