<div class="cabinet-program-wrapper col-md-12">
    <div class="cabinet-program-thumb" style="background-image: url({{url("storage/".$program->thumb)}})"></div>
    <div class="cabinet-program-content">
        <h2 class="cabinet-program-title">{{$program->name}}</h2>
        <div class="cabinet-program-description">{!! $program->description !!}</div>
        <div class="cabinet-program-footer">
            @if (Auth::user()->isProgramPurchased($program->id))

                @php
                    //$current_course = $program->getCurrentCourse();
                    $resume_url = $program->getResumeUrl();
                @endphp
                @if ($resume_url)
                <a href="{{$resume_url}}" class="cabinet-program-cta">
                    <i class="fa fa-play"></i>
                    <div class="cabinet-program-action-text">
                        <span>
                            К обучению
                        </span>
                    </div>
                </a>
                @endif
            @else 
                @php
                    $modalId = "unlock-".$program->id;
                @endphp
                <button class="cabinet-program-cta" data-modaltrigger="{{$modalId}}">
                        <i class="fa fa-unlock"></i>
                    <div class="cabinet-program-action-text">
                        <div class="cabinet-program-price">
                            Стоимость: {{$program->cost}}р.
                        </div>
                        <span>
                            Разблокировать
                        </span>
                    </div>
                </button>
                @include("cabinet.modals.paymodal", ["program" => $program])
            @endif
            <br/>
            @include('cabinet.render-courses', compact('program', 'user_courses_progress', 'current_course' ))
        </div>
    </div>
</div>