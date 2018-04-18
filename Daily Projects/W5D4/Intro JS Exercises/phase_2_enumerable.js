const doubler = function(el) {
  return el*2;
};

const halver = function(el) {
  return el/2;
};

Array.prototype.myEach = function(callback) {
  for(let i = 0; i < this.length; i++) {
    callback(this[i]);
    // console.log(cb(this[i]));
  }
};

//[1, 2, 4].myEach(halver);


//Array#myMap
Array.prototype.myMap = function (callback) {
  const result = [];

  this.myEach (function (el) {
    result.push(callback(el));
  });

  return result;
};

// console.log([1, 2, 4].myMap(doubler));

const sum = function(acc, el) {
  return acc + el;
};
const sub = function(acc, el) {
  return acc - el;
};
const mult = function(acc, el) {
  return acc * el;
};

Array.prototype.myReduce = function (callback, initialValue) {
  //if they did provide initialValuez
  let accumulator = initialValue;
  let arr = this;
  if (initialValue === undefined) {
    accumulator = this[0];
    // accumulator = initialValue;
    arr = this.slice(1);
  }
  // const arr = this.slice(1);
  arr.myEach(function(el) {
    accumulator = callback(accumulator, el);
  });
  return accumulator;
};

// console.log([3, 7, 3].myReduce(sub));
// console.log([3, 7, 3].reduce(sub));
