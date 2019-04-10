$(document).on("click", ".faq-item", function () {
    if ($(this).hasClass("opened")) {
        $(this).removeClass("opened");
        return;
    }

    $(".faq-item").removeClass("opened");
    $(this).addClass("opened");

})