const { initModal } = require('../components/modal');
const {smoothScroll} = require('../utils/scroll');


require('../menu/hamburger');
require('./faq');


$(document).on("click", "a", function(e) {


    var aid = $(this).attr("href");
    if (aid.indexOf("/#") != -1) {
        aid = aid.replace("/", "");
        if ($(aid).length) {
            e.preventDefault();
            smoothScroll($(window), $(aid).offset().top - 55, 300);
        }
    } 
})

initModal({
    name:"vk-login", 
    onBeforeOpen: function(model) {
        if (window.loggedUser) {
            window.location = "/cabinet"
            return false;
        }
        return true
    },
    onOpen: function(model) {
        $(model.dom).find(".next-step").on("click", function() {
            model.processing();
        })

    }
})