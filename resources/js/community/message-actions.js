$.ajaxSetup({
    headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    }
});


var editors = {};
function createEditor(messageId) {
    console.log("TEST")
    if ($("[data-editorid='"+messageId+"']").length == 0) return;
    tinymce.init({
        menubar: false,
        selector: "[data-editorid='"+messageId+"']",
        min_height: 100,
        resize: "vertical",
        language: 'ru',
        plugins: "link, image, code, table, textcolor, lists, codesample",
        file_browser_callback: function(field_name, url, type, win) {
            if (type == "image") {
                $("#upload_file").trigger("click");
            }
        },
        codesample_languages: [
            {text: 'HTML', value: 'markup'},
            {text: 'JavaScript', value: 'javascript'},
            {text: 'CSS', value: 'css'},
        ],
        images_upload_handler: function(blobInfo, success, failure) {
            var xhr, formData;
            xhr = new XMLHttpRequest();
            xhr.withCredentials = false;
            xhr.open("POST", "/community/tech/upload_image/message");
            var token = $('meta[name="csrf-token"]').attr('content');
            xhr.setRequestHeader("X-CSRF-Token", token);
            xhr.onload = function() {
                var json;
                if (xhr.status != 200) {
                    failure("HTTP Error: " + xhr.status);
                    return;
                }
                json = JSON.parse(xhr.responseText);

                if (!json || typeof json.location != "string") {
                    failure("Invalid JSON: " + xhr.responseText);
                    return;
                }
                success(json.location);
            };
            formData = new FormData();
            formData.append("file", blobInfo.blob(), blobInfo.filename());
            xhr.send(formData);
        },
        toolbar:
            "bold italic | bullist numlist outdent indent | link image | codesample",
        convert_urls: false,
        image_caption: true,
        image_title: true,
        init_instance_callback: function(editor) {
            editors[messageId] = editor
        }
    });

}
createEditor("new");
window.tinymce = tinymce;
window.createEditor = createEditor;

function stopSave({button, editor, messageId, redirectUrl}) {
    $(button).removeClass("disabled");
    $(button).removeClass("editing");
    $(button).text("ИЗМЕНИТЬ");

    window.location = redirectUrl;

}

function startSave(button, editor, messageId) {
    $(button).addClass("disabled");
    $(button).removeClass("editing");
    $(button).text("СОХРАНЯЕМ...");

    var content = editor.getContent();
    
    $.ajax({
        url: "/community/tech/save_message/"+messageId,
        method: "POST",
        data: {content: content, title: getCurrentTitle(messageId)},
        success: function(redirectUrl) {
            stopSave({button, editor, messageId, redirectUrl});
        }
    })
}

function getCurrentTitle(messageId) {
    var qt = $("[data-questiontitle='"+messageId+"']");
    if (qt.length == 0) return "";
    if (qt.text().trim() != "") return qt.text().trim();
    if (qt.val().trim() != "") return qt.val().trim();
    return "";
}

function initTitleEditor(messageId) {
    var qt = $("[data-questiontitle='"+messageId+"']");
    if (qt.length == 0) return;
    var title = getCurrentTitle(messageId);
    qt.after("<input class='question-title-input' data-questiontitle='"+messageId+"' value='"+title+"'/>")
    qt.remove();

}

$(document).on("click", ".edit-message", function() {
    var messageId = $(this).data("messageid");
    if ($(this).hasClass("editing")) {
        var ed = editors[messageId];
        if (!ed) return
        
        startSave(this, ed, messageId)

    } else {

        initTitleEditor(messageId);
        createEditor(messageId);

        $(this).addClass("editing");
        $(this).text("СОХРАНИТЬ");
    }
});


$(document).on("click", ".delete-message", function() {
    var messageId = $(this).data("messageid");

    var yes = confirm("Точно продолжить удаление?");
    if (!yes) return;
    $.ajax({
        url: "/community/tech/delete_message/"+messageId,
        method: "POST",
        success: function(new_url) {
            console.log(new_url);
            window.location = new_url;
        }
    })
});


$(document).on("click", ".report-message", function() {
    var messageId = $(this).data("messageid");

    var reason = prompt("Впишите причину нарушения");
    if (!reason) return;
    $.ajax({
        url: "/community/tech/report_message/"+messageId,
        method: "POST",
        data: {reason: reason},
        success: function(data) {
            alert("Ваша жалоба была успешно принята")
        }
    })


});

