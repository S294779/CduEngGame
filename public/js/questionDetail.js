$(function(){
    $.fn.pairHover = function (options) {
        $('#options-matrix .col-filled').hover(
                function (e) {
                    var dataPair = $(this).find('.content').data('pair');
                    $('#options-matrix .col-filled [data-pair="' + dataPair + '"]').closest('td').addClass('pair-matched');
                },
                function (e) {
                    var dataPair = $(this).find('.content').data('pair');
                    $('#options-matrix .col-filled [data-pair="' + dataPair + '"]').closest('td').removeClass('pair-matched');
                });

    }
    $().pairHover();
});