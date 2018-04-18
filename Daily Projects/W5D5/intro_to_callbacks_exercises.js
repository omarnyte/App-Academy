// class Clock {
//   constructor() {
//     // 1. Create a Date object.
//       const date = new Date();
//     // 2. Store the hours, minutes, and seconds.
//       this.hours = date.getHours();
//       this.minutes = date.getMinutes();
//       this.seconds = date.getSeconds();
//     // 3. Call printTime.
//       this.printTime();
//
//     // 4. Schedule the tick at 1 second intervals.
//     window.setInterval(this._tick.bind(this), 1000);
//   }
//
//   printTime() {
//     // Format the time in HH:MM:SS
//     // Use console.log to print it.
//     console.log(`${this.hours}:${this.minutes}:${this.seconds}`);
//   }
//
//   _tick() {
//     // 1. Increment the time by one second.
//       this.seconds++;
//     // second incrementation
//     if (this.seconds > 59) {
//       this.minutes += 1;
//       this.seconds = 0;
//     }
//     if (this.minutes > 59) {
//       this.hours += 1;
//       this.minutes = 0;
//     }
//     if (this.hours > 23) {
//       this.hours = 0;
//       this.minutes = 0;
//       this.seconds = 0;
//     }
//
//     // 2. Call printTime.
//     this.printTime();
//   }
// }
//
// const clock = new Clock();
// const readline = require('readline');
//
// const reader = readline.createInterface({
//   input: process.stdin,
//   output: process.stdout
// });
//
// function addNumbers(sum, numsLeft, callback){
//   if (numsLeft === 0){
//     callback(sum);
//     return;
//   }
//   console.log(`The sum is currently: ${sum}`);
//
//   reader.question("Enter number:", function(ans){
//     console.log("numLeft:", numsLeft);
//     const number = parseInt(ans);
//     addNumbers(sum + number, numsLeft-1, completionCallback);
//   });
// }
//
// function completionCallback(sum){
//   console.log(`This is our total sum: ${sum}`);
//   reader.close();
// }
//
// console.log(addNumbers(0, 3, completionCallback));

const readline = require("readline");

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

// Write this first.
function askIfGreaterThan(el1, el2) {

  reader.question(`Is ${el1} greater than ${el2}? Type 'yes' or 'no'.`, function(resp){
    if (resp === "yes") {
      resp = true;
    } else {
      resp = false;
    }


    console.log(`You wrote ${resp}`);
  });
}

// Once you're done testing askIfGreaterThan with dummy arguments, write this.
function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
  // Do an "async loop":
  // 1. If (i == arr.length - 1), call outerBubbleSortLoop, letting it
  //    know whether any swap was made.
  // 2. Else, use `askIfGreaterThan` to compare `arr[i]` and `arr[i +
  //    1]`. Swap if necessary. Call `innerBubbleSortLoop` again to
  //    continue the inner loop. You'll want to increment i for the
  //    next call, and possibly switch madeAnySwaps if you did swap.
}

// Once you're done testing innerBubbleSortLoop, write outerBubbleSortLoop.
// Once you're done testing outerBubbleSortLoop, write absurdBubbleSort.

function absurdBubbleSort(arr, sortCompletionCallback) {
  function outerBubbleSortLoop(madeAnySwaps) {
    // Begin an inner loop if you made any swaps. Otherwise, call
    // `sortCompletionCallback`.
  }

  // Kick the first outer loop off, starting `madeAnySwaps` as true.
}

absurdBubbleSort([3, 2, 1], function (arr) {
  console.log("Sorted array: " + JSON.stringify(arr));
  reader.close();
});
