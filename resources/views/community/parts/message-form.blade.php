<form autocomplete="off" method="post" action="{{route("community_save_message", ["message_id" => $message_id])}}"">
    @csrf
    <input type="hidden" name="destination_type" value="{{$destination_type}}"/>
    <input type="hidden" name="target_id" value="{{$target_id}}"/>
    <input type="hidden" name="message_type" value="{{$message_type}}"/>
    <input type="hidden" name="parent_id" value="{{$parent_id}}"/>
    <input type="hidden" name="redirect" value="1"/>
    @if ($message_type == "question" )
        <label for="title">Заголовок сообщения</label>
        <br/>
        <input name="title" id="title" required minlength="3"/>
        <br/>
    @endif
    <br/>
    <label for="body">Текст сообщения</label>
    <br/>
    <textarea class="new-message-editor" data-editorid="new" name="content"></textarea>
    @if ($message_type == "question" )
    <label for="title">Добавьте тэги через запятую</label>
    <input name = 'tags' id = 'tags' onkeyup="showSuggestions(this)"/>
    <div id='livesearch'></div>
    @endif
    <button class="main-button">Отправить</button>  

</form>

<script>

</script>