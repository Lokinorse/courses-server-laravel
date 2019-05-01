

VK.Retargeting.Init('VK-RTRG-317062-3gRde');  

var convert = window.convert = function (conversionName) {
    console.log(conversionName)
    if (conversionName.startsWith("tarif")) {
        window.selectedPlan = conversionName;
    }
    
    if (window.location.href.startsWith("http://courses")) return;
    if (!window.location.href.startsWith("https://varilo.ru")) return;
    ym(51609848, 'reachGoal', conversionName);
    VK.Retargeting.Event(conversionName)
}


$(document).on("click", "[data-conversion]", function(e) {
    var conversionName = $(this).data("conversion");
    window.convert(conversionName);
})