
<div class="message-actions-wrapper">
    <div class="action-group">
        <button class="report-message" data-messageid="{{$msg->id}}">СООБЩИТЬ О НАРУШЕНИИ</button>
    </div>
    @component('components.admin-only')
        @if ($msg->message_type == "question")
            <div class="action-group">
                    @if($msg->udemy_id)
                        <a type="submit" href="{{route("fakier_get_question_data", ["question_id"=> $msg->id])}}" class="main-button button-green" id="admin-load-question">
                            Загрузить ответы и перевести
                        </a>
                    @endif
                    @if ($msg->approved)
                        <button class="main-button button-orange approve-question" data-messageid="{{$msg->id}}">Заблочить вопрос</button>
                    @else 
                        <button class="main-button button-orange approve-question" data-messageid="{{$msg->id}}">Одобрить вопрос</button>
                    @endif 
            </div>
        @endif
    @endcomponent



    @if ($msg->hasChangePermission())
        <div class="action-group">
            <button class="edit-message" data-messageid="{{$msg->id}}">ИЗМЕНИТЬ</button>
            <button class="delete-message" data-messageid="{{$msg->id}}">УДАЛИТЬ</button>
        </div>
    @endif
</div>
@component('components.admin-only')
    <div class="message-actions-wrapper">
        @if ($msg->message_type == "question")
            @php
                $udemy_object = $msg->udemy_object()->first();
            @endphp
            @if($msg->udemy_id && $udemy_object)
                <div class="action-group">
                    Урок на юдеми: {{$udemy_object->title}}
                    <br/>
                </div>
            @endif
                <div class="action-group">
                    <form method="POST" action="{{route("community_change_message_destination", ["message_id"=> $msg->id])}}">
                        @csrf
                        @php
                            $destination_type = "";
                            if ($msg->destination_type == "lesson") {
                                $destination_type = $msg->target_id;
                            }
                        @endphp
                        Выбери урок у себя:
                        <select class="js-select-lesson" name="lesson_id">
                            
                            @foreach (\App\Lesson::all() as $lesson)
                                <option value="{{$lesson->id}}" @if($destination_type == $lesson->id) selected @endif>{{$lesson->name}}</option>
                            @endforeach
                            
                        </select>
                        <button type="button" id="reset-lesson">Сбросить</button>
                        <button type="submit">Назначить</button>
                    </form>
                </div>
        @endif
    </div>
@endcomponent

@if(sizeof($tags)>0)
    @component('components.admin-only')

        @foreach($tags as $tag)
            @if (!$tag->approved)
            ОДОБРИТЬ ТЕГИ:
                <div class = 'admin_tag_review_container'> {{$tag->name }}
                    <div class = 'tag_review_buttons'>
                        <div data-tagid="{{$tag->id}}" class = 'decline_tag'></div> 
                        <div data-tagid="{{$tag->id}}" class = 'approve_tag'></div>
                    </div>
                </div>
            @endif

        @endforeach
    @endcomponent
@endif