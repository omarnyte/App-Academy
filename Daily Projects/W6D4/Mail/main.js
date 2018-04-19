const Router = require('./router');

document.addEventListener("DOMContentLoaded", () => {

  const changeHash = (el) => {
    el.preventDefault();

    let newLocation = el.currentTarget.innerText;
    newLocation = newLocation.toLowerCase();
    window.location.hash = newLocation;
  };


  document.querySelectorAll(".sidebar-nav li").forEach((li) => {
    li.addEventListener("click", changeHash);
  });

  let content = document.querySelector(".content");
  let newRouter = new Router(content);

});
