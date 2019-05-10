@php 
$author = $msg->user()->first();
$text = $msg->getBodyPreview();

$needCheckClass = (!$msg->approved) ? "message-unchecked" : "";
@endphp 

<a class="community-message {{$needCheckClass}} preview" href="{{route("community_question", ["question_slug" => $msg->getSlug()])}}">
    <div class="preview-content">
        <div class="message-heading"> 
            @include('community.parts.user-ava', ["user" => $author])
            <div class="message-heading-text">
                <div class="author-time">
                    <span class="message-heading-author">
                        {{$author->name}}
                        <span class="message-heading-time">{{$msg->humanDiff()}}</span>
                    </span>

                    @if ($show_destination)
                        @php 
                            $lesson = $msg->lesson(); 
                            @endphp 
                        @if ($lesson)

                            <object class="related-lesson">
                                К уроку
                                <a href="{{$lesson->getUrl()}}">{{$lesson->name}}</a>
                            </object>
                        @endif
                    @endif


                </div>

            </div>
        </div>
        @if ($text) 
        <div class="message-text-preview">
                <h4>{{$msg->getTitle()}}</h4>
            {{$text}}
        </div>
        @endif 
    </div>
    <div class="answers-counter-area">
        {{$msg->answers_count}} {{Lang::choice('ответ|ответа|ответов', $msg->answers_count, [], 'ru')}}
    </div>
</a>