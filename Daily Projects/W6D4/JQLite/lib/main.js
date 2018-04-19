const DOMNodeCollection = require("./dom_node_collection.js");

window.$l = function (arg) {
  // console.log("hello world");
  // let elementList;

  if (typeof arg === 'string') {
    let elementList = document.querySelectorAll(arg);
    elementList = Array.from(elementList);
    let newElementList = new DOMNodeCollection(elementList);
    return newElementList;
  }
  else if (arg instanceof HTMLElement) {
    let htmlEl = [];
    htmlEl.push(arg);
    let newHtmlEl = new DOMNodeCollection(htmlEl);
    return newHtmlEl;
  }
};
