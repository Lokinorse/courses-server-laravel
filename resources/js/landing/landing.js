require('../components/modal');
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