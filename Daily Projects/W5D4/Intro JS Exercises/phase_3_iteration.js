//Array#bubbleSort
Array.prototype.bubbleSort = function () {
  let flag = false;

  while (flag === false) {
    flag = true;
    for (let i = 0; i < this.length-1; i++) {
      if (this[i] > this[i+1]) {
        flag = false;
        let temp = this[i];
        this[i] = this[i+1];
        this[i+1] = temp;
      }
    }
  }
  console.log(this);
};

//String#substring
String.prototype.substrings = function () {
  let results = [];
  for (let i = 0; i <= this.length; i++) {
    for (let j = i+1; j <= this.length; j++) {
      results.push(this.slice(i, j));
    }
  }
  console.log(results);
  return results;
};

// "apple".substrings();
