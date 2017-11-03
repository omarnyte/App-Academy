//Array#uniq
Array.prototype.uniq = function() {
const uniques = {};

  for (let i = 0; i < this.length; i++) {
    uniques[this[i]] = 1;
  }

  Object.keys(uniques).forEach(function(el) {
    console.log(el);
  });
};

//Array#twoSum
Array.prototype.twoSum = function() {
  const pairs = [];
  for(let i = 0; i < this.length - 1; i++) {
    for(let j = i+1; j < this.length; j++) {
      if(this[i] + this[j] === 0) {
        pairs.push([i, j]);
      }
    }
  }
  return pairs;
};

// console.log([1, -10, -4, 10, -1].twoSum());

//Array.transpose
Array.prototype.transpose = function () {
  const transposed = [];

  for (let i = 0; i < this.length; i++) {
    transposed.push([]);
  }

  for (let row = 0; row < this.length; row++) {
    // transposed[i % transposed.length].push(this[i]);
    for (let col = 0; col < this.length; col++) {
      transposed[col].push(this[row][col]);
    }
  }
  console.log(transposed);
};
