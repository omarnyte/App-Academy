const APIUtil = require("./api_util.js");



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
