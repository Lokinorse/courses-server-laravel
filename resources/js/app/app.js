require('../components/prism')

require('../bootstrap');
require('../components/tests');
var {initChat} = require('../components/chat.js');

const { initModal } = require('../components/modal');
const {initTabs} = require('../components/tabs');

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

var answerModal = initModal({
    name: "answermodal",
    openOnInit: false
})

initChat('unit-chat', 'unit', 'comment', answerModal)
initChat('unit-faq', 'unit', 'faq', answerModal)

initTabs('.communication-tabs');




