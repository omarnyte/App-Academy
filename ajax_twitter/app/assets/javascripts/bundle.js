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
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
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
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

const FollowToggle = __webpack_require__(1);

$(() => {
  let $buttons = $(".follow-toggle");
  // debugger
  $buttons.each((idx, el) => new FollowToggle(el));

});


/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(2);



class FollowToggle {
  constructor (button) {
    this.$el = $(button);
    this.userId = this.$el.data("user-id");
    this.initialFollowState = this.$el.data("initial-follow-state");
    this.handleClick();
    this.render();
  }

   render () {

    if (this.initialFollowState === true) {
      this.$el.text("Unfollow");
    } else {
      this.$el.text("Follow");
    }

    this.$el.prop("disabled", false);
  }

  switcher(){
    if(this.initialFollowState === true){
      this.$el.data("initial-follow-state",false);
      this.initialFollowState = false;
    }else {
      this.$el.data("initial-follow-state",true);
      this.initialFollowState = true;
    }

    this.render();
  }

  handleClick(){
    this.$el.on("click", (event) => {
      event.preventDefault();
      this.$el.prop("disabled", true);
      if (this.initialFollowState === true) {
        APIUtil.unfollowUser(this.userId, this.switcher.bind(this));
      } else {
        APIUtil.followUser(this.userId, this.switcher.bind(this));
      }
    });
  }
}

module.exports = FollowToggle;


/***/ }),
/* 2 */
/***/ (function(module, exports) {

const APIUtil = {
  unfollowUser: (id,cb) => {
    $.ajax({
      method: "DELETE",
      url: `/users/${id}/follow`,
      dataType: "JSON",
      success: () => {
        cb();
      },
      error: (error) => console.log(error)
    });
  },

  followUser: (id,cb) => {
    $.ajax({
      method: "POST",
      url: `/users/${id}/follow`,
      dataType: "JSON",
      success: () => {
        cb();
      },
      error: (error) => console.log(error)
    });
  }
};

module.exports = APIUtil;


/***/ })
/******/ ]);
//# sourceMappingURL=bundle.js.map