<div class="container cabinet-room">
        @if(!isset($hide_search))
            <div class="new-question-wrapper">
                <form method="get" class="search-form" action="{{route("community")}}">
                        <input placeholder="Искать вопрос" name="search" value="{{ old('search') }}"/> 
                        <button class="main-button button-grey">Искать</button>
                    </form>
                    <span>или</span> 
                    <a href="{{route('community_new_question')}}" class="main-button ask">Задать свой</a>
            </div>
        @endif
    
        @if (!isset($hide_title))
        <div class="row">
            <div class="col-md-12">
                <h1 class="program-name">{{$title}} - {{ $messages->count() }} {{Lang::choice('вопрос|вопроса|вопросов', $messages->count(), [], 'ru')}}</h1>
            </div>
        </div>
        @endif
    
        <div class="community-preview-wrapper">
            @foreach ($messages as $msg)
            @include('community.message-preview', ["msg" => $msg, "show_destination" => true])
            @endforeach
        </div>
        @if(isset($ajax)) 
            <button class="load-more" data-page="1" id="load-more">Загрузить еще</button>
        @else 
        <div class="community-preview-pagination flex-wrap" >
            {{ $messages->links() }}
        </div>
        @endif
</div>