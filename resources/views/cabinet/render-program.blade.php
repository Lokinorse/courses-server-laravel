<div class="cabinet-program-wrapper col-md-12">
    <div class="cabinet-program-thumb" style="background-image: url({{Storage::url($program->thumb)}})"></div>
    <div class="cabinet-program-content">
        <h2 class="cabinet-program-title">{{$program->name}}</h2>
        <div class="cabinet-program-description">{!! $program->description !!}</div>
        <div class="cabinet-program-footer">
            @php
                $current_course = $program->getCurrentCourse();
                $resume_url = $program->getResumeUrl();
            @endphp
            @if (Auth::user()->isProgramPurchased($program->id))

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
                @foreach ($program->plans()->get() as $plan)
                    
                    <button class="cabinet-program-cta" data-modaltrigger="{{"unlock-" . $plan->id}}">
                            <i class="fa fa-unlock"></i>
                        <div class="cabinet-program-action-text">
                            <span>
                                {{$plan->name}}
                            </span>
                            <div class="cabinet-program-price">
                            {{$plan->discounted_cost_string}}р.
                            </div>
                        </div>
                    </button>
                    @include("cabinet.modals.paymodal", ["plan" => $plan])
                @endforeach

            @endif
            <br/>
            @include('cabinet.render-courses', compact('program', 'user_courses_progress', 'current_course' ))
        </div>
    </div>
</div>