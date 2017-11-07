// sum
//
// Write a sum function that takes any number of arguments:
//
//     sum(1, 2, 3, 4) === 10
//     sum(1, 2, 3, 4, 5) === 15

function sum() {
 const numbers = Array.from(arguments);

 let count = 0;
 for (let i = 0; i < numbers.length; i++) {
   count += numbers[i];
 }

 return count;
}

// console.log(sum(1, 2, 3, 4, 5));


// Solve it first using the arguments keyword, then rewrite your solution to use the ... rest operator.
function sum(...numbers) {
 let count = 0;

 for (let i = 0; i < numbers.length; i++) {
   count += numbers[i];
 }

 return count;
}

console.log(sum(1, 2, 3, 4, 5));



// bind with args
//
// Rewrite your myBind method so that it can take both bind-time arguments and call-time arguments.
//
// A few examples:

class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

const markov = new Cat("Markov");
const breakfast = new Cat("Breakfast");

markov.says("meow", "Ned");
// Markov says meow to Ned!
// true

// bind time args are "meow" and "Kush", no call time args
markov.says.myBind(breakfast, "meow", "Kush")();
// Breakfast says meow to Kush!
// true

// no bind time args (other than context), call time args are "meow" and "me"
markov.says.myBind(breakfast)("meow", "a tree");
// Breakfast says meow to a tree!
// true

// bind time arg is "meow", call time arg is "Markov"
markov.says.myBind(breakfast, "meow")("Markov");
// Breakfast says meow to Markov!
// true

// no bind time args (other than context), call time args are "meow" and "me"
const notMarkovSays = markov.says.myBind(breakfast);
notMarkovSays("meow", "me");
// Breakfast says meow to me!
// true
Solve it first using the arguments keyword.

Within your myBind method, you'll have to define a new, anonymous function to be returned. Be careful: using arguments inside the anonymous function will not give you the arguments passed to myBind, because arguments is reset on every function invocation (just like this).

That makes sense, because there are two arrays of arguments you care about: the extra arguments passed to myBind, and the arguments passed when the bound function is called.

Once you've done that, write a second version using the ... rest operator.

Function.prototype.myBind = function (context, ...bindArgs) {
  return (...callArgs) => {
    return this.apply(context, bindArgs.concat(callArgs));
  };
};

class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

const markov = new Cat("Markov");
const breakfast = new Cat("Breakfast");

markov.says("meow", "Ned");
// Markov says meow to Ned!
// true

// bind time args are "meow" and "Kush", no call time args
markov.says.myBind(breakfast, "meow", "Kush")();

// Breakfast says meow to Kush!
// true

// no bind time args (other than context), call time args are "meow" and "me"
markov.says.myBind(breakfast)("meow", "a tree");
// Breakfast says meow to a tree!
// true

// bind time arg is "meow", call time arg is "Markov"
markov.says.myBind(breakfast, "meow")("Markov");
// Breakfast says meow to Markov!
// true

// no bind time args (other than context), call time args are "meow" and "me"
const notMarkovSays = markov.says.myBind(breakfast);
notMarkovSays("meow", "me");
