$(function(){
    $.fn.setErrorMessage = function(options){
        var errorCnt = 0;
        $(this).closest('div').find('.form-error-message').each(function(e){
            errorCnt++;
        });
        if(errorCnt == 0){
            $(this).closest('div').addClass('has-error');
            $(this).closest('div').append('<p class="form-error-message">'+options.message+'<p>');
        }
    }
    $.fn.removeErrorMessage = function(options){
        $(this).closest('div').removeClass('has-error');
        $(this).closest('div').addClass('has-success');
        $(this).closest('div').find('.form-error-message').remove();
    }
});


