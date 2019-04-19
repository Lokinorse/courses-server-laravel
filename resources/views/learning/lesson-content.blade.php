@php 
    $videos = json_decode($current_lesson->videos);
    $videoURL = null;
    if (isset($videos[0])) $videoURL = url("storage/".json_decode($current_lesson->videos)[0]);


    $content = $current_lesson->description;
    if (trim($content) == "") $content = null;

    $currentLessonStatus = $current_lesson->getStatus($progress);
@endphp

<script>
    var currentProgram = {!! json_encode($program) !!}
    var currentLesson = {!! json_encode($current_lesson) !!}

</script>

@switch($currentLessonStatus)
    @case(-3)
        @include('learning.lesson-states.locked', [ "course" => $course ])
        @break
    
    @case(-2)
        @include('learning.lesson-states.in-creation')
        @break

    @default
        @include('learning.lesson-states.opened', [
            "program" => $program,
            "current_lesson" => $current_lesson, 
            "status" => $currentLessonStatus, 
            "course" => $course
        ])
@endswitch

