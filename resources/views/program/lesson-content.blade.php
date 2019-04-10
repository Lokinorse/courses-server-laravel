@php 
    $videos = json_decode($lesson->videos);
    $videoURL = null;
    if (isset($videos[0])) $videoURL = url("storage/".json_decode($lesson->videos)[0]);


    $content = $lesson->description;
    if (trim($content) == "") $content = null;


@endphp

@if ($videoURL)
    <div class="lesson-pane">
        <h5>Видео</h5>
        <div class="lesson-pane-content">    
            <video src="{{$videoURL}}" controls></video>
        </div>
    </div>
    @endif
    
    @if ($content)
    <div class="lesson-pane">
        <h5>Материалы к уроку</h5>
        <div class="lesson-pane-content">
            {!! $content !!}
        </div>    
    </div>
@endif