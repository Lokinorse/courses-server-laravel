@if ($current_lesson_status == 0)

    <div class="lesson-pane">
        
        @php 
            $test = $current_lesson->test()->first();
            @endphp
        @if ($test) 
            <h5>Тестирование</h5>
            <div class="lesson-pane-content">    
                <span>Для прохождения к следующему уроку тебе нужно пройти тест на знания по этому уроку</span>
            </div>
            <div class="lesson-pane-footer">
                <button data-testid="{{$test->id}}" class="open_test main-button"><i class="fa fa-arrow-right"></i>  Пройти тест</button>
                <script>var test_questions = {!!$test->getJSON()!!}</script>
            </div>

        @else 
            <h5>Переход к следующему уроку</h5>
            <div class="lesson-pane-content">    
                <span>Если ты повторил и сделал все, о чем сказано в уроке, можешь смело переходить к следующему уроку</span>
            </div>
            <div class="lesson-pane-footer">
                <a href="{{url('/pass_unit/'.$program->id.'/'.$current_lesson->id)}}" class="main-button"><i class="fa fa-arrow-right"></i> Перейти к следующему уроку</a>
            </div>
        @endif 


    </div>

@endif
