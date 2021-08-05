document.addEventListener("turbolinks:load", function() {
  let clock = document.querySelector('.clock')
  if (clock) { 
    $(".clock").countdown(clock.dataset.endTime, function(event) {
      $(this).html(
        event.strftime('%M:%S')
      );
    }).on('finish.countdown', function() {
      $(".submit-button")[0].click()
    });
  }
}) 

