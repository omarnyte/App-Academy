//range(start, end)
const range = function range (start, end) {
  if (start > end) {
    return [];
  }

  let arr = [start].concat(range(start+1, end));
  return arr;
};

const sumRec = function sumRec (arr) {
  if (arr.length === 0) {
    return 0;
  }
  return arr[0] + sumRec(arr.slice(1));
};

const exponent = function exponent (base, exp) {
  if (exp === 0) {
    return 1;
  }

  return base * exponent(base, exp-1);
};

const exp2 = function exp2 (base, exp) {
  if (exp === 0)
    return 1;
  if (exp === 1)
    return base;
  if (exp % 2 === 0) {
    return exp2(base, exp / 2) * exp2(base, exp / 2);
  } else {
    return base * (exp2(base, (exp - 1) / 2)) * (exp2(base, (exp - 1) / 2));
  }
};

const fib = function fib (n) {
  if (n < 2)
    return [1];

  let prev_fibs = fib(n-1);
  return prev_fibs.slice(-1)[0].concat(fib(prev_fibs.slice(-1)[0]))

  // let result = [];
  // let end_value = fib(n-1).slice(-1)[0] + fib(n-2).slice(-1)[0];
  // result.push(end_value)
  // return result
};


// const Cat = function Cat() {
//   this.name = "fluffy";
// };
//
// // const g = () => console.log(this.name);
//
// const Dog = function Dog() {
//   this.name = "Fido";
//   this.f = function (arg) {
//     // this.name; //refers to cat
//     console.log(`${this.name}`);
//   };
//   this.g = () => console.log(this.name);
//   this.f = this.f.bind(this)
// };
//
// const dog = new Dog();
// const f = dog.f;
// const g = dog.g;
// f();
// g();
//
//
// this.name = "window";
//
// cat.f();
// dog.f();
// f();


const bsearch = function bsearch(arr, target, cheater) {
  if (cheater === undefined) {
    cheater = 0;
  }
  let midIdx = arr.length/2;
  if (arr.length % 2 !== 0) {
    midIdx = Math.floor(arr.length/2);
  }
  // console.log(midIdx);

  let midVal = arr[midIdx];
  if (midVal === target) {
    return cheater + midIdx;
  }

  if (midVal > target) {
    return bsearch(arr.slice(0, midIdx), target, cheater);
  } else {
    cheater += midIdx + 1;
    return bsearch(arr.slice(midIdx+1), target, cheater);
  }
};
