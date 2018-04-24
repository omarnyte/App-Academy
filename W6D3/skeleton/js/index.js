console.log("Hello from the JavaScript console!");

// Your AJAX request here
// It should be a GET request.
// It should get the New York weather from this url: http://api.openweathermap.org/data/2.5/weather?q=NY,NY&appid=bcb83c4b54aee8418983c2aff3073b3b
// If the request fails, sign up for your own API key here and stick that key in place of bcb83c4b54aee8418983c2aff3073b3b.
// It should take a success callback
// In the success callback, console.log out what the weather is.
$.ajax({
  url: 'http://api.openweathermap.org/data/2.5/weather?q=NY,NY&appid=bcb83c4b54aee8418983c2aff3073b3b',
  type: 'GET',
  success(data) {
    console.log("Weather:");
    console.log(data);
  },
  error() {
    console.log("Sorry, there was an error!");
  },
});

// Add another console log here, outside your AJAX request
console.log("Done");
