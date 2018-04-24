// Write a function titleize that takes an array of names and a function (callback). titleize should use Array.prototype.map to create a new array full of titleized versions of each name - titleize meaning "Roger" should be made to read "Mx. Roger Jingleheimer Schmidt". Then pass this new array of names to the callback, which should use Array.prototype.forEach to print out each titleized name.
//
// > titleize(["Mary", "Brian", "Leo"], printCallback);
// Mx. Mary Jingleheimer Schmidt
// Mx. Brian Jingleheimer Schmidt
// Mx. Leo Jingleheimer Schmidt
// undefined

function titleize(names, callback) {
  let titleized = names.map(name => `Mx. ${name} Jingleheimer Schmidt`);
  callback(titleized);
};


// Phase II: Constructors, Prototypes, and this
//
// First write a constructor function for an elephant. Each elephant should have a name, height (in inches), and array of tricks in gerund form (e.g. "painting a picture" rather than "paint a picture").
//
// Next write a few prototype functions that will be shared among all elephants:
//
// Elephant.prototype.trumpet: should print "(name) the elephant goes 'phrRRRRRRRRRRR!!!!!!!'"
// Elephant.prototype.grow: should increase the elephant's height by 12 inches
// Elephant.prototype.addTrick(trick): add a new trick to their existing repertoire
// Elephant.prototype.play: print out a random trick, e.g. "(name) is (trick)!"
// Hint: look up some JS Math methods!
// Make sure to create an elephant and test all of these functions out on them method style!

function Elephant(name, height, tricks){
  this.name = name;
  this.heigh = height;
  this.tricks = tricks;
};

Elephant.prototype.trumpet = function(name) {
  console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!'`)
};

Elephant.prototype.grow = function() {
  this.height += 12;
};

Elephant.prototype.addTrick(trick) = function {
  this.tricks.push(trick);
}

Elephant.prototype.play = function () {
  trickIndex = Math.floor(Math.random() * this.tricks.length);
  console.log(`${this.name} is ${this.tricks[trickIndex]}!`);
};

const jerry = new Elephant("Jerry", 80, ["balancing on his trunk"])
