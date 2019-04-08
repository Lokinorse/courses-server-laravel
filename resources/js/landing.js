require('./components/fakeModal');

$(document).on("click", ".mobile-hamb", function() {
	$(".nav-content").toggleClass("opened");
})

$(document).on("click", ".varilo-nav .nav-link", function() {
	$(".nav-content").removeClass("opened");
})

$(document).on("click", ".faq-item", function() {
    if ($(this).hasClass("opened")) {
    	$(this).removeClass("opened");
        return;
    }

    $(".faq-item").removeClass("opened");
    $(this).addClass("opened");

})


function smoothScroll(el, to, duration) {
    if (duration < 0) {
        return;
    }
    var difference = to - $(window).scrollTop();
    var perTick = difference / duration * 10;
    this.scrollToTimerCache = setTimeout(function() {
        if (!isNaN(parseInt(perTick, 10))) {
            window.scrollTo(0, $(window).scrollTop() + perTick);
            smoothScroll(el, to, duration - 10);
        }
    }.bind(this), 10);
}


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

window.selectedPlan = "tarif-ya-sam";

//VK.Retargeting.Init('VK-RTRG-317062-3gRde');  
/* var convert = window.convert = function (conversionName) {
    console.log(conversionName)

    if (conversionName.startsWith("tarif")) {
        window.selectedPlan = conversionName;
    }

    if (window.location.href.startsWith("http://courses")) return;
    ym(51609848, 'reachGoal', conversionName);
    VK.Retargeting.Event(conversionName)
} */



/* $(document).on("click", "[data-conversion]", function(e) {
    //e.preventDefault();
    var conversionName = $(this).data("conversion");
    convert(conversionName);
}) */