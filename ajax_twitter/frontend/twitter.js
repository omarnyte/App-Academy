const FollowToggle = require("./follow-toggle.js");
const UsersSearch = require("./users_search");



$(() => {
  let $buttons = $(".follow-toggle");
  $buttons.each((idx, el) => new FollowToggle(el));

let $search = $(".users-search");

$search.each((idx, el) => new UsersSearch(el));
});
