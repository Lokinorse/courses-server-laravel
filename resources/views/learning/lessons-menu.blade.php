<div class="unit-block">
@foreach ($sorted_lessons as $key => $lesson)

    @php
        $isActive = $lesson->id == $current_lesson->id;
        $href = url($program->slug . '/' . $course->slug . '/' . $lesson->slug);
        $icon = "";
        $currentLessonStatus = $lesson->getStatus($progress);
        
        $progressBadge = null; 

        switch ($currentLessonStatus) {
            case -1:
                $progressBadge = "lock-open";
            break;
            case -2:
                $progressBadge = "hourglass-half";
            break;
            case -3:
                $progressBadge = "lock";
            break;
            case 0:
                $progressBadge = "arrow-right";
            break;
            case 1:
                $progressBadge = "check-circle";
            break;
            case 2:
                $progressBadge = "check-double";
            break;
            case 3:
                $progressBadge = "hourglass-half";
            break;
            default:
                $progressBadge = null;
            break;
        }



        switch ($lesson->lesson_type) {
            case 'video':
                $icon = "video";
                break;
            case 'test':
                $icon = "list";
                break;
            case 'practices':
                $icon = "graduation-cap";
                break;
            default:
                $icon = "video";
                break;
        }


    @endphp

    @if ($lesson->lesson_type == "divider") 
        <div class="lesson-divider">
            <span>{{$lesson->name}}</span>
            <div class="divider-line"></div>
        </div>
    @else 
    
        <a class="unit @if($isActive) active @endif lesson-{{$lesson->lesson_type}}" href="{{$href}}">
            <div class="lesson-title">
                <span>
                    <span class="lesson-icon fa fa-{{$icon}}" aria-hidden="true"></span>
                    {{ $key + 1}}. {{$lesson->name}}
                </span>
                @if ($progressBadge) <span class="{{$progressBadge}} unit-badge fa fa-{{$progressBadge}}"></span> @endif
            </div>
            
            @if ($isActive)
                <span class="lesson-short-description">{{$lesson->short_description}}</span>
            @endif
        </a>
    @endif

        
        
@endforeach
</div>