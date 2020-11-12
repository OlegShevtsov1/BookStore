$(document).on('turbolinks:load', function(){
    $('.use_billing').on('click', function(){
        let checked_box = $('.use_billing')[0].hasAttribute('checked');
        if(checked_box){
            $('.use_billing').removeAttr('checked')
            $('.shipping-form').css('display', 'block')
        }else{
            $('.use_billing').attr('checked', 'true')
            $('.shipping-form').css('display', 'none')
        }
    });
});
