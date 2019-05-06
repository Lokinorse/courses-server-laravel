<script>
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

    $(document).on("mousedown", ".message-heading-ava", function(e) {
        e.preventDefault();
        
        var userid = $(this).data("userid");
        
        var yes = confirm("Перевоплотиться в пользователя?");
        if (!yes) return;
        $.ajax({
            url: "/community/tech/skin_user/"+userid,
            method: "POST",
            success: function(data) {
                window.location = window.location;
            }
        })
    });

    $(document).on("click", ".approve-question", function() {
    var messageId = $(this).data("messageid");

    var yes = confirm("Точно продолжить одобрение?");
    if (!yes) return;
    $.ajax({
        url: "/community/tech/approve_message/"+messageId,
        method: "POST",
        success: function(data) {
            window.location = window.location;
        }
    })


    });
    $(document).on("click", "#reset-lesson", function() {
        $('.js-select-lesson').val('').trigger('chosen:updated');
    });


    createEditor("new")

</script>