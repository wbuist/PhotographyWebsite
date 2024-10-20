(function($) {

    var $window = $(window),
        $body = $('body'),
        $header = $('#header');

    // Play initial animations on page load.
    $window.on('load', function() {
        setTimeout(function() {
            $body.removeClass('is-preload');
        }, 100);
    });

    // Check if on mobile and add touch mode.
    if (/Mobi|Android/i.test(navigator.userAgent)) {
        $body.addClass('is-touch');
    }

    // Simple parallax effect using CSS properties for larger screens.
    if ($window.width() > 980) {
        $window.on('scroll', function() {
            var scrollPos = $window.scrollTop();
            $header.css('background-position', 'center ' + (-scrollPos / 3) + 'px');
        });
    }

})(jQuery);

