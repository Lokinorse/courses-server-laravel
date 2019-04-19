var debug = true;

function initChat(chatId, destination_type, message_type, answerModal) {
    var loop = null;
    var $chatWrapper = $("#"+chatId);
    if (!$chatWrapper.length) return;
    var input =  $("#"+chatId + " .message-input");

    function refreshChat(callback) {
        if (!$chatWrapper.length) return;
        $.ajax({
            url: `/messages/${destination_type}/${chat_target_id}/${message_type}`,
            method: "get"
        }).done(res => {
            var chatmessages = $chatWrapper.find(".chat-messages")
            $chatWrapper.find(".chat-messages").html(res);
            callback();
        })
    }
    
    function refreshLoop() {
        if (!chatId || !destination_type || !chat_target_id) return 
        refreshChat(function() {
            if (debug) return;
            loop = setTimeout(refreshLoop, 5000)
        })
    }

    function sendMessage(message, parentId) {
        if (loop) clearTimeout(loop);
        input.val("");
        
        parentId = parentId ? "/"+parentId : "";

        $.ajax({
            url: `/sendMessage/${destination_type}/${chat_target_id}/${message_type}${parentId}`,
            method: "get",
            data: {
                message: message
            }
        }).done(res => {
            refreshLoop();
        })
    }


    $(document).on("keydown", "#"+chatId + " .message-input", function(e) {
        if (e.keyCode == 13) {
            var message = e.target.value;
            sendMessage(message)
        }
    });
    
    $(document).on("click", "#"+chatId + " .send-chat-message", function(e) {
        var message = input.val();
        sendMessage(message)
    })


    $(document).on('click', "#"+chatId + " .make_reply", function() {
        answerModal.open();
        var parentId = $(this).data('messageid');
        var message_type = $(this).data('messagetype');
    
        $(answerModal.dom).find(".answer-area").val("")
        $(answerModal.dom).find(".main-button").on("click", function() {
            var text = $(answerModal.dom).find(".answer-area").val();
            sendMessage(text, parentId)
            answerModal.close();
            $(answerModal.dom).find(".answer-area").val("")
        })
    })


    refreshLoop();
}





module.exports = {
    initChat: initChat
}