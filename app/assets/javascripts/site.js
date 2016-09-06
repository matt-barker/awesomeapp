$(document).on('turbolinks:load', function(){
    //Product ratings
    $('.rating').raty({ path: '/assets', scoreName: 'comment[rating]' });
    $('.rated').raty({ path: '/assets',
      readOnly: true,
      score: function() {
        return $(this).attr('data-score');
      }
    });
    
    //Fade the rails alerts after 5 seconds
    $('.alert').delay(5000).fadeOut(500);
});