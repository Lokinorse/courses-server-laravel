@if ($current_lesson_status == 0)

    <div class="lesson-pane">
        
        @php 
            $test = $current_lesson->lesson_type=='test';
        @endphp

        @switch($current_lesson->lesson_type)
            @case('test')
                <h5>Тестирование знаний</h5>
                <div class="lesson-pane-content">    
                    <span>Для прохождения к следующему уроку тебе нужно пройти тест на знания по этому уроку</span>
                </div>
                <script>
                    var test_questions = {!!$current_lesson->getJSONTest()!!}
                    var nextLessonUrl = "{{$program->getNextLessonUrl($current_lesson->id)}}"
                </script>
                <div id="test-wrapper">           
                    <div class="modal-content"></div> 
                    <div class="modal-footer">
                        <div class="actions-group"></div>
                    </div>
                </div>
                @break
            @default
                <h5>Переход к следующему уроку</h5>
                <div class="lesson-pane-content">    
                    <span>Если ты повторил и сделал все, о чем сказано в уроке, можешь смело переходить к следующему уроку</span>
                </div>
                <div class="lesson-pane-footer">
                    <a href="{{url('/pass_lesson/'.$program->id.'/'.$current_lesson->id)}}" class="main-button">
                        <i class="fa fa-arrow-right"></i> Перейти к следующему уроку
                    </a>
                </div>
        @endswitch


    </div>

@endif
