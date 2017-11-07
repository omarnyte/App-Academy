// Functional programming is another programming paradigm. It's an alternative to object-oriented programming, though the two can also be mixed. We'll learn more about it later, but briefly, functional programming focuses on function composition (writing functions which are given a function as an argument and return a new function).
//
// One pattern seen in functional programming is currying. Currying is the process of decomposing a function that takes multiple arguments into one that takes single arguments successively until it has the sufficient number of arguments to run. This technique is named after the logician Haskell Curry (the functional programming language Haskell is, too).
//
// Here's an example of two ways to use a sumThree function. The first is a typical version that takes 3 arguments; the second is a curried version:
//
// function sumThree(num1, num2, num3) {
//   return num1 + num2 + num3;
// }
//
// sumThree(4, 20, 6); // == 30
//
// // you'll write `Function#curry`!
// let f1 = sumThree.curry(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
// f1 = f1(4); // [Function]
// f1 = f1(20); // [Function]
// f1 = f1(6); // = 30
//
// // or more briefly:
// sumThree.curry(3)(4)(20)(6); // == 30
// Note that the curried version returns functions at each invocation until it has the full number of arguments it needs. At this point it actually invokes sumThree and returns the result.
//
// Write a curriedSum function that takes an integer (how many numbers to sum) and returns a function that can be successively called with single arguments until it finally returns a sum. That is:
//
// const sum = curriedSum(4);
// sum(5)(30)(20)(1); // => 56
// Hint: curriedSum(numArgs) should:
//
// Define an empty array, numbers.
// Defines a function, _curriedSum that:
// Closes over numArgs and numbers.
// Takes a single number as an argument.
// Appends this to numbers each time.
// If numbers.length === numArgs, it sums the numbers in the array and returns the result.
// Else, it returns itself.
// Returns _curriedSum.
// If you're confused, think of it this way: _curriedSum keeps collecting arguments and returning itself until it has enough arguments, at which point it actually does the required work of summing.



function curriedSum(numArgs){
  let numbers = [];

  function _curriedSum(num){
    numbers.push(num);
    console.log(num);
    console.log(numbers);
    console.log(numArgs);
    if(numbers.length === numArgs){
      let sum = 0;

      for(let i = 0; i < numbers.length; i++){
        sum += numbers[i];
      }
      return sum;
    } // if

    else{
      return _curriedSum;
    }

  }

  return _curriedSum;
}

// const sum = curriedSum(4);
// console.log(sum(5)(30)(20)(1)); // => 56



Function.prototype.curry1 = function (numArgs) {
  const args = [];
  const fn = this;
  function _curriedFn(arg) {
    args.push(arg);
    if (args.length === numArgs) {
      return fn.apply(null, args);
    } else {
      return _curriedFn;
    }
  }
  return _curriedFn;
};

// let sample = curry1(3);
