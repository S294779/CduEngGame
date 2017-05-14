$(function(){
    $.fn.pairHover = function (options) {
        $('#answer-matrix .col-matched').hover(
                function (e) {
                    var dataPair = $(this).find('.content').data('pair');
                    $('#answer-matrix .col-matched [data-pair="' + dataPair + '"]').closest('td').addClass('pair-matched');
                },
                function (e) {
                    var dataPair = $(this).find('.content').data('pair');
                    $('#answer-matrix .col-matched [data-pair="' + dataPair + '"]').closest('td').removeClass('pair-matched');
                });

    }
    $().pairHover();
});