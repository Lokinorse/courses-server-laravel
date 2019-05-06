@php
    $messages = $messages->sortByDesc('id');
@endphp

@if ($messages->count() < 1)

    <div class="empty-chat">
        Пока сюда еще никто не написал
        <br/>
        Стань первым!
    </div>

@endif


@foreach ($messages as $message)
    @php
        $user = $message->user()->first();    
        $childMessages = $message->childs()->get();
        $hasParent = $message->parent_id;
        $questionClass = (!$hasParent) ? "faq-question" : "";
    @endphp

    <div class="message-wrapper {{$questionClass}}">
        
        <div class="avatar-thumb">
            <img src="{{$user->getFallbackAva()}}"/>
        </div>
        <div class="message-content">
            @if (!$hasParent) 
                <h4><i class="fa fa-question-circle"></i> вопрос</h4>
            @endif
            <div class="message-badge">
                <div class="message-header">
                    <a target="_blank" href="https://vk.com/id{{$user->provider_user_id}}"><img src="{{asset("img/vk_logo.png")}}"/> {{$user->name}}</a>
                    <span class="message-date">{{$message->humanDiff()}}</span>
                </div>
                <div class="message-text">
                    {{$message->text}}            
                </div>
                @if (auth()->user()->id==1)
                <div class="message-actions-wrapper">
                    <button class="make_reply" data-messagetype="comment" data-messageid="{{$message->id}}" data-author="{{$user->name}}">ответить</button>
                </div>
                @endif
            </div>
            @if ($childMessages->count() > 0 )
                <span class="reply"><i class="fa fa-level-down-alt"></i> в ответ</span>
                @include('components.chat', ['messages'=>$childMessages])
            @endif
        </div>
    </div>
    
@endforeach