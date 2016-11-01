
var refreshRatings = function(){
    $('.rating').raty({ path: '/images', scoreName: 'comment[rating]', });
    $('.rated').raty({ path: '/images',
      readOnly: true,
      score: function() {
        return $(this).attr('data-score');
      }
    });
};

$(document).on('turbolinks:load', function(){
    //Product ratings
    refreshRatings();
    //Fade the rails alerts after 5 seconds
    $('.alert').delay(5000).fadeOut(500);
    
    //Elevate zoom
    $('.img-zoom').elevateZoom();
    
});