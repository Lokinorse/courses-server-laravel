@php 
$author = $msg->user()->first();
$text = $msg->getBodyPreview();
$avatar = $author->avatar;
@endphp 

<a class="community-message" href="{{route("community_question", ["question_id" => $msg->id])}}">
    <div class="message-heading"> 
        <div class="message-heading-ava">
            <img src="{{$avatar}}"/>
        </div>
        <div class="message-heading-text">
            <div class="author-time">
                <span class="message-heading-author">{{$author->name}}</span>
                <span class="message-heading-time">{{$msg->humanDiff()}}</span>
            </div>
            <h4>{{$msg->getTitle()}}</h4>
        </div>
    </div>
    @if ($text) 
    <p class="message-text-preview">
        {{$text}}
    </p>
    @endif 
</a>