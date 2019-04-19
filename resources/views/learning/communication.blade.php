<div class="lesson-pane communication-tabs">
    <div class="tab-headers">
        <div class="tab-pill active" id="comments">Комментарии</div>
        <div class="tab-pill" id="faq">Задать вопрос по уроку</div>
    </div>

    <script>var chat_target_id = {{$current_lesson->id}};</script>
    <div class="lesson-pane-content tab-content active" data-tabtarget="comments">
        <div id="unit-chat" class="chat-wrapper">
            @if (Auth::user()) 
                <div class="chat-input">
                    <input class="message-input" placeholder="Напиши сюда свое сообщение"/>
                    <button class="send-chat-message main-button">Написать</button>
                </div>
            @endif
            <div class="chat-messages"></div>
        </div>
    </div>    
    <div class="lesson-pane-content tab-content" data-tabtarget="faq">
        <div id="unit-faq" class="chat-wrapper">
            @if (Auth::user()) 
                <div class="chat-input">
                    <input class="message-input" placeholder="Впиши сюда свой вопрос"/>
                    <button class="send-chat-message main-button">Задать вопрос</button>
                </div>
            @endif
            <div class="chat-messages"></div>
        </div>
    </div>  
</div>

@include("learning.modals.answer")