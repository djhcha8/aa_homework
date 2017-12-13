console.log("Hello from the JavaScript console!");

// Your AJAX request here

// Add another console log here, outside your AJAX request
$.ajax({
  url: "http://api.openweathermap.org/data/2.5/weather?q=New%20York&appid=bcb83c4b54aee8418983c2aff3073b3b",
  type: 'GET',
  success: function(response) {
    console.log(response);
  }
});

console.log("My first AJAX request!!")
