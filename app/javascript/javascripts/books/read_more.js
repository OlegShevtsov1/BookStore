$(document).on('turbolinks:load', function () {
    $('#read_more').click(function (e) {
        e.preventDefault()
        $('#read_more').fadeOut()
        $('#short_description').fadeOut()
        $('#full_description').fadeIn()
    })
});
