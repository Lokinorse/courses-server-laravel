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


@php
    $messages = $current_lesson->messages()->orderBy("id", "desc")->paginate(50);
@endphp


<div class="cabinet-room">

        <div class="cabinet-room">

                <div class="row">
                    <div class="col-md-12">
                    <h1 class="program-name">Задать свой вопрос</h1>
                    </div>
                </div>
            
                @include('community.parts.new-message-wrapper', [

                    "message" => [
                        "destination_type" => "lesson",
                        "target_id" => $current_lesson->id,
                        "message_type" => "question",
                        "message_id" => "new",
                        "parent_id" => 0,
                    ]
                ])
            
            </div>   
    
        <div class="row">
            <div class="col-md-12">
            <h1 class="program-name">К уроку - {{ $messages->total() }} вопросов</h1>
            </div>
        </div>
    
        <div class="community-preview-wrapper">
            @foreach ($messages as $msg)
    
            @include('community.message-preview', ["msg" => $msg, "show_destination" => false])
            @endforeach
        </div>
        
        <div class="community-preview-pagination">
            {{ $messages->links() }}
        </div>
</div>


@section('custom-admin-script')

@include('community.parts.admin-scripts')

<script>
    createEditor("new");
</script>


@endsection 