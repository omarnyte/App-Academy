Function.prototype.inherits = function(Parent){

  function Surrogate(){}
  Surrogate.prototype = Parent.prototype;

  this.prototype = new Surrogate();
  this.prototype.constructor = this;
};


// function MovingObject (name) {
//   this.name = name;
// }
//
// function Ship (length) {
//
// }
// Ship.inherits(MovingObject);
//
// function Asteroid (circumfrence) {}
// Asteroid.inherits(MovingObject);


function Dog(name) {
  this.name = name;
}

Dog.prototype.bark = function bark() {
  console.log(this.name + " barks!");
};

function Corgi(name) {
  Dog.call(this, name);
}

Corgi.inherits(Dog);

Corgi.prototype.waddle = function waddle() {
  console.log(this.name + " waddles!");
};

const blixa = new Corgi("Blixa");
blixa.bark();
blixa.waddle();
