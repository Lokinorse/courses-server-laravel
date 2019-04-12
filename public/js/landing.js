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
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ({

/***/ "./resources/js/components/modal.js":
/*!******************************************!*\
  !*** ./resources/js/components/modal.js ***!
  \******************************************/
/*! no static exports found */
/***/ (function(module, exports) {

window.initedModals = {};

function openmodal(name) {
  var html = $("#" + name).html();
  $("body").append(html);
}

function closemodal(name) {
  $("[data-modal='" + name + "']").remove();
}

function Modal(_ref) {
  var name = _ref.name,
      onOpen = _ref.onOpen,
      onBeforeOpen = _ref.onBeforeOpen,
      onClose = _ref.onClose;
  this.name = name;
  this.onOpen = onOpen;
  this.onBeforeOpen = onBeforeOpen;
  this.onClose = onClose;
  var modal = this;
  this.opened = false;

  this.open = function () {
    if (modal.onBeforeOpen) {
      if (!modal.onBeforeOpen(modal)) return;
    }

    openmodal(name);
    modal.opened = true;
    modal.dom = $("[data-modal='" + name + "']")[0];
    if (modal.onOpen) modal.onOpen(modal);
  };

  this.close = function () {
    closemodal(name);
    if (modal.onClose) modal.onClose(modal);
  };

  this.processing = function () {
    if (!modal.dom) return;
    $(modal.dom).find('.modal-content').html("Загрузка...");
  };
}

function initModal(params) {
  //Init open triggers
  var modal = new Modal(params);
  var name = params.name;
  $(document).on("click", "[data-modaltrigger='" + name + "']", function () {
    modal.open();
  }); //Close by times symbol

  $(document).on("click", "[data-modalclose='" + name + "']", function () {
    modal.close();
  }); //Cancel propagation to wrapper

  $(document).on("mouseup", "[data-modal='" + name + "'] .modal-inner-content", function (event) {
    event.stopImmediatePropagation();
  }); //Close by 

  $(document).on("mouseup", "[data-modal='" + name + "']", function () {
    modal.close();
  });

  if (params.openOnInit) {
    modal.open();
  }

  window.initedModals["name"] = modal;
  return modal;
}

$(document).on('click', '[data-modaltrigger]', function (event) {
  var modalName = $(this).data('modaltrigger');
  if (window.initedModals[modalName]) return window.initedModals[modalName].open();
  initModal({
    name: modalName,
    openOnInit: true
  });
});
module.exports = {
  initModal: initModal
};

/***/ }),

/***/ "./resources/js/landing/faq.js":
/*!*************************************!*\
  !*** ./resources/js/landing/faq.js ***!
  \*************************************/
/*! no static exports found */
/***/ (function(module, exports) {

$(document).on("click", ".faq-item", function () {
  if ($(this).hasClass("opened")) {
    $(this).removeClass("opened");
    return;
  }

  $(".faq-item").removeClass("opened");
  $(this).addClass("opened");
});

/***/ }),

/***/ "./resources/js/landing/landing.js":
/*!*****************************************!*\
  !*** ./resources/js/landing/landing.js ***!
  \*****************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

var _require = __webpack_require__(/*! ../components/modal */ "./resources/js/components/modal.js"),
    initModal = _require.initModal;

var _require2 = __webpack_require__(/*! ../utils/scroll */ "./resources/js/utils/scroll.js"),
    smoothScroll = _require2.smoothScroll;

__webpack_require__(/*! ../menu/hamburger */ "./resources/js/menu/hamburger.js");

__webpack_require__(/*! ./faq */ "./resources/js/landing/faq.js");

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
initModal({
  name: "vk-login",
  onBeforeOpen: function onBeforeOpen(model) {
    if (window.loggedUser) {
      window.location = "/cabinet";
      return false;
    }

    return true;
  },
  onOpen: function onOpen(model) {
    $(model.dom).find(".next-step").on("click", function () {
      model.processing();
    });
  }
});

/***/ }),

/***/ "./resources/js/menu/hamburger.js":
/*!****************************************!*\
  !*** ./resources/js/menu/hamburger.js ***!
  \****************************************/
/*! no static exports found */
/***/ (function(module, exports) {

$(document).on("click", ".mobile-hamb", function () {
  $(".nav-content").toggleClass("opened");
});
$(document).on("click", ".varilo-nav .nav-link", function () {
  $(".nav-content").removeClass("opened");
});

/***/ }),

/***/ "./resources/js/utils/scroll.js":
/*!**************************************!*\
  !*** ./resources/js/utils/scroll.js ***!
  \**************************************/
/*! no static exports found */
/***/ (function(module, exports) {

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

module.exports = {
  smoothScroll: smoothScroll
};

/***/ }),

/***/ "./resources/sass/app.scss":
/*!*********************************!*\
  !*** ./resources/sass/app.scss ***!
  \*********************************/
/*! no static exports found */
/***/ (function(module, exports) {

// removed by extract-text-webpack-plugin

/***/ }),

/***/ "./resources/sass/landing.scss":
/*!*************************************!*\
  !*** ./resources/sass/landing.scss ***!
  \*************************************/
/*! no static exports found */
/***/ (function(module, exports) {

// removed by extract-text-webpack-plugin

/***/ }),

/***/ 0:
/*!*******************************************************************************************************!*\
  !*** multi ./resources/js/landing/landing.js ./resources/sass/app.scss ./resources/sass/landing.scss ***!
  \*******************************************************************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

__webpack_require__(/*! C:\laragon\www\courses\resources\js\landing\landing.js */"./resources/js/landing/landing.js");
__webpack_require__(/*! C:\laragon\www\courses\resources\sass\app.scss */"./resources/sass/app.scss");
module.exports = __webpack_require__(/*! C:\laragon\www\courses\resources\sass\landing.scss */"./resources/sass/landing.scss");


/***/ })

/******/ });