require('../bootstrap');
require('../components/prism')

require('../components/tests');
//var {initChat} = require('../components/chat.js');
//require('video.js');

const { initModal } = require('../components/modal');
//const {initTabs} = require('../components/tabs');
require("../menu/hamburger");
require('../components/retarg');
require('../community/message-actions');

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

//initChat('unit-chat', 'unit', 'comment', answerModal)
//initChat('unit-faq', 'unit', 'faq', answerModal)
//
//initTabs('.communication-tabs');

window.showSuggestions = function(e){
    if(e.value.length==0) {
        $('#livesearch').html("");
        $('#livesearch').css('border', "0px");
        return    
    } 
    $.get(
        "livesearch/" + e.value,  
        function(data) {     
            $('#livesearch').html("");
            data.forEach(item=>{
                $('#livesearch').append("<p class = 'suggest'>" + item + "</div>");
            })
            if(data!=="undefined"&&data.length>0){
                $('#livesearch').css('border', "1px solid #a5acb2");
            }
        }
      );
}

$(document).on("click", ".suggest", function (e) {
    $("#tags").val($(this).html());
    $('#livesearch').html("");
    $('#livesearch').css('border', "0px");
})