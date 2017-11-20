var timerInterval;

function startTimer() {
  if ($('#play').length) {
    if (timerInterval) clearInterval(timerInterval);
    var time = 15;

    timerInterval = setInterval(function() {
      time--;

      if (time === 0) {
        clearInterval(timerInterval);
        window.location = '/fails?reason=time';
      } else {
        $('#timer').html(time);
      }
    }, 1000);
  }
}

$( document ).on('turbolinks:load', function() {
  startTimer();
});

$(document).ready(function() {
  startTimer();
});
