@if ($current_lesson_status == 0)

    <div class="lesson-pane">
            <h5>Переход к следующему уроку</h5>
            <div class="lesson-pane-content">    
                <span>Если ты повторил и сделал все, о чем сказано в уроке, можешь смело переходить к следующему уроку</span>
            </div>
            <div class="lesson-pane-footer">
                @php 
                    $test = $current_lesson->test()->first();
                @endphp
                @if ($test) 
                    <button data-testid="{{$test->id}}" class="open_test main-button"><i class="fa fa-arrow-right"></i>  Пройти тест</button>
                    <script>
                        var test_questions = {!!$test->getJSON()!!}
                    </script>
                    

                @else 
                    <a href="{{url('/pass_unit/'.$program->id.'/'.$current_lesson->id)}}" class="main-button"><i class="fa fa-arrow-right"></i> Перейти к следующему уроку</a>
                @endif 
            </div>
    </div>

@endif
