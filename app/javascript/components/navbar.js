
var countdown_divs = document.querySelectorAll(".upcoming_match")
console.log(countdown_divs)
countdown_divs.forEach((div) => {
  var dateOff = new Date().getTimezoneOffset() * -1
  var countDownDate = new Date(div.innerHTML).getTime() - (dateOff * 60 * 1000);
  console.log(sorted[array.sort.first].location.split(",").last.strip.inspect.html_safe)
  if ((sorted[array.sort.first].location.split(",").last.strip.inspect.html_safe === "Rostov-on-Don") || (sorted[array.sort.first].location.split(",").last.strip.inspect.html_safe === "Sochi") ||(sorted[array.sort.first].location.split(",").last.strip.inspect.html_safe  === "Saransk") || ( sorted[array.sort.first].location.split(",").last.strip.inspect.html_safe  === "Kazan")) {
    var tZone = "Europe/" + "Moscow";
  } else if ( sorted[array.sort.first].location.split(",").last.strip.inspect.html_safe  === "Yekaterinburg") {
    var tZone = "Asia/" + "Yekaterinburg";
  } else {
    var trueLoc = sorted[array.sort.first].location.split(",").last.strip.inspect.html_safe ;
    var tZone = "Europe/" + trueLoc;
  }
  // Update the count down every 1 second
  var x = setInterval(function() {
    // Get todays date and time
    var date = new Date()
    var dtrue = date.toLocaleString('en-UK', {timeZone: tZone })
    var now = new Date(dtrue).getTime();

    // Find the distance between now an the count down date
    var distance = countDownDate - now;

    // Time calculations for days, hours, minutes and seconds
    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((distance % (1000 * 60)) / 1000);

    // Display the result in the element with id="demo"
    div.innerHTML = days + "d " + hours + "h "
    + minutes + "m " + seconds + "s ";

    // If the count down is finished, write some text
    if (distance < 0) {
      clearInterval(x);
      div.innerHTML = "LIVE";
    }
  }, 1000);
});
  // Set the date we're counting down to
var countdown_divs = document.querySelectorAll(".upcoming_match")
console.log(countdown_divs)
countdown_divs.forEach((div) => {
  var dateOff = new Date().getTimezoneOffset() * -1
  var countDownDate = new Date(div.innerHTML).getTime() - (dateOff * 60 * 1000);
    // Update the count down every 1 second
  var tZone = "Europe/" + "Moscow";
  var xstp = setInterval(function() {
      // Get todays date and time
      var date = new Date()
      var dtrue = date.toLocaleString('en-UK', {timeZone: tZone })
      var now = new Date(dtrue).getTime();

      // Find the distance between now an the count down date
      var distance = countDownDate - now;

      // Time calculations for days, hours, minutes and seconds
      var days = Math.floor(distance / (1000 * 60 * 60 * 24));
      var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
      var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
      var seconds = Math.floor((distance % (1000 * 60)) / 1000);

      // Display the result in the element with id="demo"
      div.innerHTML = days + "d " + hours + "h "
      + minutes + "m " + seconds + "s ";

      // If the count down is finished, write some text
      if (distance < 0) {
        clearInterval(xstp);
        div.innerHTML = "LIVE";
      }
    }, 1000);
  });
var countdown_divs = document.querySelectorAll(".upcoming_match")
console.log(countdown_divs)
countdown_divs.forEach((div) => {
  var dateOff = new Date().getTimezoneOffset() * -1
  var countDownDate = new Date(div.innerHTML).getTime() - (dateOff * 60 * 1000);
  // Update the count down every 1 second
  var tZone = "Europe/" + "Moscow";
  var xstp = setInterval(function() {
    // Get todays date and time
    var date = new Date()
    var dtrue = date.toLocaleString('en-UK', {timeZone: tZone })
    var now = new Date(dtrue).getTime();

    // Find the distance between now an the count down date
    var distance = countDownDate - now;

    // Time calculations for days, hours, minutes and seconds
    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((distance % (1000 * 60)) / 1000);

    // Display the result in the element with id="demo"
    div.innerHTML = days + "d " + hours + "h "
    + minutes + "m " + seconds + "s ";

    // If the count down is finished, write some text
    if (distance < 0) {
      clearInterval(xstp);
      div.innerHTML = "LIVE";
    }
  }, 1000);
});


export {  };
