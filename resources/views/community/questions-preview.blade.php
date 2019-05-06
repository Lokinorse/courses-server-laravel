<div class="container cabinet-room">

        <div class="new-question-wrapper">
            <form method="get" class="search-form" action="{{route("community")}}">
                <input placeholder="Искать вопрос" name="search" value="{{ old('search') }}"/> 
                    <button class="main-button button-grey">Искать</button>
            </form>
            <span>или</span> 
            <a href="{{route('community_new_question')}}" class="main-button ask">Задать свой</a>
        </div>
    
    
        <div class="row">
            <div class="col-md-12">
            <h1 class="program-name">{{$title}} - {{ $messages->total() }} вопросов</h1>
            </div>
        </div>
    
        <div class="community-preview-wrapper">
            @foreach ($messages as $msg)
    
            @include('community.message-preview', ["msg" => $msg, "show_destination" => true])
            @endforeach
        </div>
        
        <div class="community-preview-pagination">
            {{ $messages->links() }}
        </div>
</div>