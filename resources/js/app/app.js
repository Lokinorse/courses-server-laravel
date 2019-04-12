require('../components/prism')

require('../bootstrap');
const { initModal } = require('../components/modal');


$(document).on("click", ".nav-chapter-list .nav-link", function (e) {
    e.preventDefault();
    e.stopPropagation();


    $(".nav-chapter-list .nav-link").removeClass("active");
    $(this).addClass("active");

    var paneId = $(this).data("paneid");

    $(".lesson-wrapper .tab-pane").removeClass("active");
    $("#" + paneId).addClass("active");


})


var promoModal = initModal({
    name: "promocode",
    openOnInit: true
})

var infoModal = initModal({
    name: "infomodal",
    openOnInit: true
})