@foreach ($lessons->all() as $key => $menuItem)

    @php
        $isActive = null;
        $styles = null;
        
        $child = $menuItem->first();
        
        $childMenu = $menuItem->last();

        $href = "#child".$child->id;
        $isLesson = false;
        switch ($child->unit_type) {
            case 1:
            # "1": "Курс",
                $icon = "graduation-cap";
                $unit_type_text = "Курс";
                $unit_class = "unit-course";
            break;
            case 2:
            # "2": "Глава",
                $icon = "book";
                $unit_type_text = "Раздел";
                $unit_class = "unit-chapter";
                break;
            case 3:
                # "3": "Урок"
                $icon = "play-circle";
                $unit_type_text = "Урок";
                $href = url($program->slug."/".$child->slug);
                $isLesson = true;
                $unit_class = "unit-lesson";
                
                break;
            default:
                $icon = "voyager-study";
                $unit_type_text = "Программа";
                $unit_class = "unit-program";
                break;
        }

        $currentLessonStatus = $child->getStatus($progress);
        
        $progressBadge = null; 
        switch ($currentLessonStatus) {
            case -1:
                $progressBadge = "unlock";
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

        

        $isActive = $child->slug == $lesson->slug;
    
        $isPathPart = collect($breadcrumbs)->contains($child->id);
        
    @endphp

<div class="unit-block {{$unit_class}}">
    @if ($isLesson)
        <a class="unit @if($isActive) active @endif" href="{{$href}}">
            <span>
                <span class="fa fa-{{$icon}}" aria-hidden="true"></span>
                {{ $key + 1}} {{$child->name}}
            </span>
            @if ($progressBadge) <span class="{{$progressBadge}} unit-badge fa fa-{{$progressBadge}}"></span> @endif
        </a>
    @else 
        <div class="unit @if (!$isPathPart) collapsed @endif" data-toggle="collapse" href="{{$href}}" role="button">
            <span>
                <span class="fa fa-chevron-right" aria-hidden="true"></span>
                {{$child->name}}
            </span>
        </div>
        @if (isset($childMenu) && $childMenu->count() > 0)
        <div class="collapse nav-chapter-list-wrapper @if ($isPathPart) show @endif" id="child{{$child->id}}">
            @include('learning.lesson-menu', ['menu' => $childMenu, 'progress' => $progress, 'lesson' => $lesson])
        </div>
        @endif
    @endif 
            
</div>



@endforeach