$(document).on('ready page:load', function (e) {

    if($('#new-post-button').is('*')) {
        $('#new-post-button').on('click', function () {
            $('#new-post-container').addClass('active');
        });

        $('#new-post-close').on('click', function () {
            $('#new-post-container').removeClass('active');
        });
    }

});