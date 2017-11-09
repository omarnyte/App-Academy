const FollowToggle = require("./follow-toggle.js");

$(() => {
  let $buttons = $(".follow-toggle");
  // debugger
  $buttons.each((idx, el) => new FollowToggle(el));

});
