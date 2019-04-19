<ol class="dd-list">

        @php
            $questions = $questions->sortBy(function ($item, $key) {
                return $item->order;
            });
        @endphp
        
        
        
        @foreach ($questions as $question)
        
            <li class="dd-item question-item" data-id="{{ $question->id }}">
                <div class="pull-right item_actions">
                    <div class="btn btn-sm btn-danger pull-right question_item_delete" data-id="{{ $question->id }}">
                        <i class="voyager-trash"></i>
                    </div>
                </div>
                <div class="form-input pull-left">
                    <form class="test-item-change" data-type="question" data-id="{{ $question->id }}">
                        <input type="text" value="{{ $question->name }}" name="name"/>
                        <button>сохранить вопрос</button>
                    </form>
                </div>

                <div class="dd-handle question_handle" data-questionid={{$question->id}}>
                </div>
        
                <ol class="dd-list">

                    @php
                        $answers = $question->answers()->get()->sortBy(function ($item, $key) {
                            return $item->order;
                        });
                    @endphp

                    @foreach($answers as $answer) 
                        <li class="dd-item answer-item" data-id="{{ $answer->id }}">
                            <div class="pull-right item_actions">
                                <div class="btn btn-sm btn-danger pull-right answer_item_delete" data-id="{{ $answer->id }}">
                                    <i class="voyager-trash"></i>
                                </div>
                            </div>
                            <div class="form-input pull-left">
                                    <form class="test-item-change" data-type="answer" data-id="{{ $answer->id }}">
                                        <input type="text" value="{{ $answer->name }}" name="name"/>
                                        <input type="checkbox" name="is_right" @if ( $answer->is_right) checked @endif/>
                                        <button>сохранить ответ</button>
                                    </form>
                                </div>
                            <div class="dd-handle">
                            </div>
                        </li>
                    @endforeach
                </ol>
            </li>
        
        
        @endforeach
        
</ol>