$(document).on("click", ".mobile-hamb", function () {
    $(".nav-content").toggleClass("opened");
})

$(document).on("click", ".varilo-nav .nav-link", function () {
    $(".nav-content").removeClass("opened");
})