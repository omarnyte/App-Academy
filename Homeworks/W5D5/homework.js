window.setTimeout(function() {
  alert('HAMMERTIME')
}, 5000);


function hammerTime (time) {
  window.setTimeout(function () {
    alert(`${time} is hammertime!`)
  })
}


const readline = require('readline');

const reader = readline.createInterface({

  input: process.stdin,
  output: process.stdout
});

function teaAndBiscuits () {
  reader.question('Would you like some tea?', function (ans1) {
    console.log(`You replied ${ans1}.`);
    reader.question('Would you like some biscuits?', function (ans2) {
      console.log(`You replied ${ans2}.`);

      const first = (ans1 === 'yes') ? 'do' : 'don\'t';
      const second = (ans2 === 'yes') ? 'do' : 'don\'t';

      console.log(`So you ${first} want tea and you ${second} want biscuits.`);
      reader.close();
    });
  });
}
