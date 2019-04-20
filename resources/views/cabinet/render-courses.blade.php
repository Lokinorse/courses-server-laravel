<div class='cabinet-program-courses'>

    
    <b>Курсы в программе</b>
    <div class="courses-list-wrapper">

        @php 
            $course_index = 1;
        @endphp
        @foreach ($program->sortedCourses() as $index => $course)
                @php
        
                    $current_course_state = $user_courses_progress->first(function($state) use ($course) {
                        return $state->course_id == $course->id; 
                    });
                    
                    $state = ($course->unlocked) ? "unlocked" : "locked";
                    if ($current_course_state) {
                        $state = ($current_course_state->status) ? "done" : "process";
                    }
                    $current_course_id = (isset($current_course->id)) ? $current_course->id : 0;
                    $current_class = ($course->id == $current_course_id) ? "current" : "";
                @endphp
            <a href="{{url($program->slug . '/' . $course->slug)}}" class="course-item {{$current_class}}">
                    


                <div class="course-thumb">
                    <div class="badge index-badge">
                        {{$course_index++}}
                    </div>
    
                    @switch($state)
                        @case("unlocked")
                            <div class="badge lock-badge"><i class="fa fa-lock-open"></i></div>
                            @break
                        @case("locked")
                            <div class="badge lock-badge"><i class="fa fa-lock"></i></div>
                            @break
                        @case("done")
                            <div class="badge done-badge"><i class="fa fa-check"></i></div>
                            @break
                        @case("process")
                        <div class="badge play-badge"><i class="fa fa-play"></i></div>
                            @break
                        @default
                    @endswitch


                    <img src="{{url("storage/".$course->thumb)}}"/>
                </div>
                <div class="course-name">{{$course->name}}</div>
            </a>
        @endforeach
    </div>
</div>
