$(document).on('ready page:load', function (e) {

    if ($('.notifications-container').is('*')) {
        setTimeout(function () {
            $('.notifications-container').fadeOut();
        }, 3000);
    }

});