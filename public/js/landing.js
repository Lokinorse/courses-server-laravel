/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "/";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 2);
/******/ })
/************************************************************************/
/******/ ({

/***/ "./resources/js/components/fakeModal.js":
/*!**********************************************!*\
  !*** ./resources/js/components/fakeModal.js ***!
  \**********************************************/
/*! no static exports found */
/***/ (function(module, exports) {

function openmodal(top) {
  modalStepChange(0);
  $(".lesson-payout-modal-wrapper").addClass("opened");
  $(".lesson-payout-modal").css("position", "fixed");
  $(".lesson-payout-modal").css("top", "30px");
  $(".lesson-payout-modal").css("left", "0px");

  if (window.location.search && window.location.search.indexOf("fullscreen=1") !== -1 && top) {
    $(".lesson-payout-modal").css("top", top - 250 + "px");
  }
}

window.openmodal = openmodal;

var modalStepChange = window.modalStepChange = function (step) {
  $(".pay-step").removeClass("active");
  $(".pay-step[data-modalstep='" + step + "']").addClass('active');

  if (step == 1) {
    $("#current-plan").html(window.plans[window.selectedPlan].name);
    $("#price-number").html(window.plans[window.selectedPlan].price);
  }
};

function closemodal() {
  $(".lesson-payout-modal-wrapper").removeClass("opened");
}

$(document).on("submit", "#payment-form", function (e) {
  e.preventDefault();
  var formData = $(this).serializeArray();
  modalStep++;
  modalStepChange(modalStep);
  setTimeout(function () {
    modalStep++;
    modalStepChange(modalStep);
  }, 1500);
  window.convert("oplata");
  formData.push({
    value: window.plans[window.selectedPlan].name,
    name: "plan"
  }, {
    value: window.location.href,
    name: "url"
  }, {
    value: window.plans[window.selectedPlan].price,
    name: "price"
  });
  $.post("/transaction", formData, function (data) {
    console.log(data);
  });
});
$(document).on("click", ".next-step", function (e) {
  e.stopPropagation();
  e.preventDefault();
  modalStep++;
  modalStepChange(modalStep);

  if (modalStep == 2) {}
});
$(document).on("click", ".payment-action-button-wrapper", function (e) {
  window.convert("rassilka");
});
$(document).on("click", ".lesson-payout-modal-body", function (e) {
  e.stopImmediatePropagation();
});
$(document).on("click", ".lesson-payout-modal-wrapper, .pay-modal-close", function (e) {
  closemodal();
}); //openmodal()

/***/ }),

/***/ "./resources/js/landing.js":
/*!*********************************!*\
  !*** ./resources/js/landing.js ***!
  \*********************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

__webpack_require__(/*! ./components/fakeModal */ "./resources/js/components/fakeModal.js");

$(document).on("click", ".mobile-hamb", function () {
  $(".nav-content").toggleClass("opened");
});
$(document).on("click", ".varilo-nav .nav-link", function () {
  $(".nav-content").removeClass("opened");
});
$(document).on("click", ".faq-item", function () {
  if ($(this).hasClass("opened")) {
    $(this).removeClass("opened");
    return;
  }

  $(".faq-item").removeClass("opened");
  $(this).addClass("opened");
});

function smoothScroll(el, to, duration) {
  if (duration < 0) {
    return;
  }

  var difference = to - $(window).scrollTop();
  var perTick = difference / duration * 10;
  this.scrollToTimerCache = setTimeout(function () {
    if (!isNaN(parseInt(perTick, 10))) {
      window.scrollTo(0, $(window).scrollTop() + perTick);
      smoothScroll(el, to, duration - 10);
    }
  }.bind(this), 10);
}

$(document).on("click", "a", function (e) {
  var aid = $(this).attr("href");

  if (aid.indexOf("/#") != -1) {
    aid = aid.replace("/", "");

    if ($(aid).length) {
      e.preventDefault();
      smoothScroll($(window), $(aid).offset().top - 55, 300);
    }
  }
});
window.selectedPlan = "tarif-ya-sam"; //VK.Retargeting.Init('VK-RTRG-317062-3gRde');  

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

/***/ }),

/***/ 2:
/*!***************************************!*\
  !*** multi ./resources/js/landing.js ***!
  \***************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

module.exports = __webpack_require__(/*! C:\laragon\www\courses\resources\js\landing.js */"./resources/js/landing.js");


/***/ })

/******/ });