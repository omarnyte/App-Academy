class DOMNodeCollection {
  constructor(arr) {
    this.arr = arr;
  }

  html(str) {
    if (typeof str !== 'undefined') {
      this.arr.forEach(node => {
        node.innerHTML = str;
      });
      return this;
    }
    else {
      return this.arr[0].innerHTML;
    }
  }

  empty() {
    this.arr.forEach( node => {
      node.innerHTML = "";
    });
  }

  append(els) {
    this.arr.forEach ( node => {
      if (typeof els === "string") {
        node.innerHTML += els;
      }
      else if (els instanceof HTMLElement) {
        // els = new DOMNodeCollection(els);
        node.appendChild(els.cloneNode(true));
      }
      else {

      }
    });
  }
}

module.exports = DOMNodeCollection;
