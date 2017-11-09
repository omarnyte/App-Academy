const APIUtil = require("./api_util.js");

class UsersSearch {
  constructor (el) {
    this.$el = $(el);
    this.$input = this.$el.children(".search-bar");
    this.$ul = this.$el.children(".users");
    this.$button = this.$el.children(".button");
    this.handleInput();
  }

  handleInput () {
    this.$input.on("input", (event) => {
      APIUtil.searchUsers(this.$input.val(), () => {
        console.log("SUCCESS!");
      });
    });


  }

}
module.exports = UsersSearch;
