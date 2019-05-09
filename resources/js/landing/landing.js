window.selectedPlan = "tarif-ya-sam";

require("../components/retarg");
const { initModal } = require("../components/modal");
const { smoothScroll } = require("../utils/scroll");

require("../menu/hamburger");
require("./faq");

$(document).on("click", "a", function(e) {
    var aid = $(this).attr("href");
    if (aid.indexOf("/#") != -1) {
        aid = aid.replace("/", "");
        if ($(aid).length) {
            e.preventDefault();
            smoothScroll($(window), $(aid).offset().top - 55, 300);
        }
    }
});

$(document).on("click", ".load-more", function(e) {
    var isLoading = $(this).data("loading");
    if (isLoading == "1") return;
    var page = $(this).data("page");
    var nextPage = page+1;

    var url = "/?page=" + nextPage;
    var $button = $(this);
    $button.text("Загрузка...");
    $button.data("loading", "1");
    $.get(url, function(content) {
        var comments = $(content).find(".community-preview-wrapper").html();
        if (comments.trim() == "") $button.remove();
        $(".community-preview-wrapper").append(comments);
        
        $button.text("ЗАГРУЗИТЬ ЕЩЕ");
        $button.data("loading", "0");
        $button.data("page", nextPage);
    })


});

function Inc(obj) {
    var elem = obj.elem;
    var input = (elem.nodeName.toLowerCase() === 'input') ? true: false;
    var value = parseFloat(elem.getAttribute('data-inc-value')) || 0;
    var duration = parseInt(elem.getAttribute('data-inc-duration')) || 0;
    var delay = parseInt(elem.getAttribute('data-inc-delay')) || 0;
    var decimal = ((obj.decimal > 2) ? 2 : obj.decimal) || 0;
    var currency = obj.currency || '';
    var speed = ((obj.speed < 30) ? 30 : obj.speed) || 30;
    var count = 0;
    var increment = value / (duration / speed);
    var interval = null;
    var regex = /\B(?=(\d{3})+(?!\d))/g;
    var run = function() {
      count += increment;
      if (count < value) {
        (input) ? elem.value = currency + (count).toFixed(decimal).toString().replace(regex, ' ') : elem.innerHTML = currency + (count).toFixed(decimal).toString().replace(regex, ' ');
      } else {
        clearInterval(interval);
        (input) ? elem.value = currency + (value).toFixed(decimal).toString().replace(regex, ' ') : elem.innerHTML = currency + (value).toFixed(decimal).toString().replace(regex, ' ');
      }
    };
    setTimeout(function() {
      interval = setInterval(run.bind(this), speed);
    }.bind(this), delay);
    this.reset = function() {
      clearInterval(interval);
      value = parseFloat(elem.getAttribute('data-inc-value')) || 0;
      duration = parseInt(elem.getAttribute('data-inc-duration')) || 0;
      increment = value / (duration / speed);
      delay = parseInt(elem.getAttribute('data-inc-delay')) || 0;
      count = 0;
      interval = setInterval(run, speed);
    }.bind(this);
  } // Inc

$(".count").each(function() {
    new Inc({
        elem: this,
        decimal: 0,
        speed: 50,
    })
})


initModal({
    name: "vk-login",
    onBeforeOpen: function(model) {
        if (window.loggedUser) {
            window.location = "/cabinet";
            return false;
        }
        return true;
    },
    onOpen: function(model) {
        $(model.dom)
            .find(".next-step")
            .on("click", function() {
                model.processing();
            });
    }
});
