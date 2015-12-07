$(document).on('ready page:load', function (e) {

    $('form.like-form').on('ajax:success', function () {
        if ($(this).hasClass('active')) {
            $(this).find('span').html(parseInt($(this).find('span').html()) - 1);
        }
        else {
            $(this).find('span').html(parseInt($(this).find('span').html()) + 1);
        }
        $(this).toggleClass('active');
    });

    $('form.retweet-form').on('ajax:success', function () {
        $(this).addClass('submitted');
        $(this).find('span').html(parseInt($(this).find('span').html()) + 1);
    });

});