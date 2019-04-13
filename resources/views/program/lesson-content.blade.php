@php 
    $videos = json_decode($lesson->videos);
    $videoURL = null;
    if (isset($videos[0])) $videoURL = url("storage/".json_decode($lesson->videos)[0]);


    $content = $lesson->description;
    if (trim($content) == "") $content = null;

    $currentLessonStatus = $lesson->getStatus($progress);
@endphp

@switch($currentLessonStatus)
    @case(-3)
        @include('program.lesson-states.locked', [ "program" => $program ])
        @break
    
    @case(-2)
        @include('program.lesson-states.in-creation')
        @break

    @default
        @include('program.lesson-states.opened', [
            "lesson" => $lesson, 
            "status" => $currentLessonStatus, 
            "program" => $program
        ])
@endswitch