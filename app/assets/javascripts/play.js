var time = 15;

$( document ).on('turbolinks:load', function() {
  time = 15;
});

$(document).ready(function() {
  setInterval(function() {
    time--;
    if (time === 0) {
      window.location = '/fails?reason=time';
    } else {
      $('#timer').html(time);
    }
  }, 1000);
});
