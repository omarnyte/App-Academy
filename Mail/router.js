class Router {
  constructor (node) {
    this.node = node;
    this.start();
  }

  start () {
    this.render();
    window.addEventListener("hashchange", () => {
      this.render();
    });
  }

  activeRoute () {
    let route = window.location.hash;
    route = route.slice(1);
    return route;
  }

  render () {
    this.node.innerHTML = "";
    const actRoute = this.activeRoute();
    // const name = actRoute.value();
    const p = document.createElement("p");
    p.innerHTML = actRoute;

    this.node.appendChild(p);
  }
}

module.exports = Router;
