require('../components/prism')

require('../bootstrap');
require('../components/modal');



$(document).on("click", ".nav-chapter-list .nav-link", function (e) {
    e.preventDefault();
    e.stopPropagation();


    $(".nav-chapter-list .nav-link").removeClass("active");
    $(this).addClass("active");

    var paneId = $(this).data("paneid");

    $(".lesson-wrapper .tab-pane").removeClass("active");
    $("#" + paneId).addClass("active");


})
