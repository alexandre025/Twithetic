$(document).on('ready page:load', function (e) {

    if ($('#new-post-button').is('*')) {
        $('#new-post-button').on('click', function () {
            $('#new-post-container').addClass('active');
        });

        $('#new-post-close').on('click', function () {
            $('#new-post-container').removeClass('active');
        });

        function recountTweet() {
            value = 140 - $('.new-post textarea').val().length;
            $('.new-tweet-count').html(value);
            if (value <= 0) {
                $('input[type=submit]').prop('disabled', true);
            }
            else if (value > 140) {
                $('input[type=submit]').prop('disabled', true);
            }
            else {
                $('input[type=submit]').prop('disabled', false);
            }
        };

        $('.new-post textarea').on('change', function (e) {
            recountTweet();
        });

        $('.new-post textarea').on('keyup', function (e) {
            recountTweet();
        });

        $('.new-post textarea').on('keydown', function (e) {
            recountTweet();
        });

        $('.new-post form').on('submit', function (e) {
            if ($('.new-post textarea').val().length <= 140 && $('.new-post textarea').val().length > 0) {
                return true;
            }
            else {
                e.preventDefault();
                return false;
            }
        });


    }

});