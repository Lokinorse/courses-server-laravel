@php
    $messages = $messages->sortByDesc('id');
@endphp

@if ($messages->count() < 1)

    <div class="empty-chat">
        Не было задано ни одного вопроса
        <br/>
        Стань первым!
    </div>

@endif


@foreach ($messages as $message)
    @php
        $user = $message->user()->first();    
        $childMessages = $message->childs()->get();
    @endphp

    <div class="message-wrapper">
        <div class="avatar-thumb">
            <img src="{{$user->avatar}}"/>
        </div>
        <div class="message-content">
            <div class="message-badge">
                <div class="message-header">
                    <a target="_blank" href="https://vk.com/id{{$user->provider_user_id}}"><img src="{{asset("img/vk_logo.png")}}"/> {{$user->name}}</a>
                    <span class="message-date">{{$message->humanDiff()}}</span>
                </div>
                <div class="message-text">
                    {{$message->text}}            
                </div>
                <div class="message-actions-wrapper">
                    <button class="make_reply" data-messagetype="comment" data-messageid="{{$message->id}}" data-author="{{$user->name}}">ответить</button>
                </div>
            </div>
            @if ($childMessages->count() > 0 )
                <span class="reply"><i class="fa fa-level-down-alt"></i> в ответ</span>
                @include('components.chat', ['messages'=>$childMessages])
            @endif
        </div>
    </div>
    
@endforeach