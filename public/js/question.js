$(function () {
    var odd_even = 1;
    var uniquePair = '';

    $.fn.addOption = function (options) {
        var numOfPair = $('#options-container tr').length;

        $('#add-option-btn').unbind().on('click', function (e) {
            var errors = 0;
            if ($('#first-option-pair').val() == '') {
                errors++;
                $('#first-option-pair').setErrorMessage({
                    message: "Can't be blanked."
                });
            } else {
                $('#first-option-pair').removeErrorMessage();
            }
            if ($('#second-option-pair').val() == '') {
                errors++;
                $('#second-option-pair').setErrorMessage({
                    message: "Can't be blanked."
                });
            } else {
                $('#second-option-pair').removeErrorMessage();
            }
            if (errors == 0) {
                numOfPair++;
                var optHtml = '<tr>';
                optHtml += '<td class="op-item"><div class="content" data-key="[' + numOfPair + '][1]">' + $('#first-option-pair').val() + '</div></td>';
                optHtml += '<td class="op-item"><div class="content" data-key="[' + numOfPair + '][2]">' + $('#second-option-pair').val() + '</div></td>';
                optHtml += '<td style="width:50px"><a class="fa fa-2x fa-trash option-remove-btn"></a></td>';
                optHtml += '</tr>';
                $('#options-container').append(optHtml);
                $('#first-option-pair').val('');
                $('#second-option-pair').val('');
                $().removeOption();
                $().selectOptions();
            }
        });
    }
    $.fn.removeOption = function (e) {
        $('.option-remove-btn').unbind().on('click', function (e) {
            var found = false;
            $(this).closest('tr').find('.op-item .content').each(function (e) {
                var optionKey = $(this).data('key');

                $('#options-matrix tr').each(function (e) {
                    $(this).find('.col-filled .content').each(function (e) {
                        var usedKey = $(this).data('key');
                        if (optionKey == usedKey) {
                            found = true;
                        }
                    });
                });
            });
            if (found == true) {
                alert('This option has been used.');
            } else {
                var result = confirm('Are you sure you want to delete this item?');
                if (result) {
                    $(this).closest('tr').remove();
                }
            }
        });
    }
    $.fn.selectOptions = function (options) {
        $('.op-item').on('click', function (e) {
            $('.op-item').removeClass('active');
            $(this).addClass('active');
        });
    }
    $.fn.pasteOptions = function (options) {

        $('#options-matrix tr td').unbind().on('click', function (e) {

            if ($('#options-container tr .active').length == 0) {
                alert('Please select the question above.');
            } else {

                if ($(this).hasClass('col-filled')) {
                    alert("You can't overwrite item.");

                } else {
                    if (odd_even == 1) {
                        odd_even = 2;
                        uniquePair = $.now();
                    } else {
                        odd_even = 1;
                    }
                    var selectedObj = $('#options-container tr .active .content').clone();

                    var row = $(this).closest('tr').index() + 1;
                    var col = $(this).index() + 1;
                    selectedObj.attr('data-pair', uniquePair);
                    selectedObj.attr('data-yposition', row);
                    selectedObj.attr('data-xposition', col);

                    $(this).html(selectedObj);

                    if (odd_even == 2) {
                        $('#options-container tr').each(function (e) {
                            $(this).css('pointer-events', 'none');
                        });
                    } else {
                        $('#options-container tr').each(function (e) {
                            $(this).css('pointer-events', 'auto');
                        });
                    }

                    $().pairHover();
                }

                $(this).addClass('col-filled');
                $('#options-container tr .active').closest('tr').find('.op-item').each(function (e) {
                    if ($(this).hasClass('active')) {
                        $(this).removeClass('active');
                    } else {
                        $(this).addClass('active');
                    }
                });
            }

        });
    }
    $.fn.setAnsMatirxSize = function (options) {
        $('#ans-matrix-size-x,#ans-matrix-size-y').on('input', function (e) {
            var tablehtml = '';
            var x_value = $('#ans-matrix-size-x').val();
            var y_value = $('#ans-matrix-size-y').val();
            if (x_value == '') {
                x_value = 0;
            }
            if (y_value == '') {
                y_value = 0;
            }
            for (var i = 1; i <= y_value; i++) {
                tablehtml += '<tr>';
                for (var j = 1; j <= x_value; j++) {
                    tablehtml += '<td><div class="content">Empty</div></td>';
                }
                tablehtml += '</tr>';
            }
            $('#options-matrix').html(tablehtml);
            $().pasteOptions();
            $().selectOptions();
            $().addOption();
            $().removeOption();

            $.contextMenu({
                selector: '#options-matrix .col-filled',
                callback: function (key, options) {
                    if (key == 'delete') {
                        this.find('.content').removeAttr('data-key');
                        var unitPair = this.find('.content').data('pair');
                        if ($('#options-matrix [data-pair="' + unitPair + '"]').length == 1) {
                            odd_even = 1;
                        }
                        $('#options-matrix [data-pair="' + unitPair + '"]').closest('td').removeClass('col-filled');
                        $('#options-matrix [data-pair="' + unitPair + '"]').closest('td').html('<div class="content">Empty</div>');
                        if (odd_even == 2) {
                            $('#options-container tr').each(function (e) {
                                $(this).css('pointer-events', 'none');
                            });
                        } else {
                            $('#options-container tr').each(function (e) {
                                $(this).css('pointer-events', 'auto');
                            });
                        }
                    }
                },
                items: {
                    delete: {name: "Delete", icon: "delete"},
                }
            });
        });
        $('#ans-matrix-size-x, #ans-matrix-size-y').on('blur', function (e) {
            var no_of_box = parseInt($('#ans-matrix-size-x').val()) * parseInt($('#ans-matrix-size-y').val());
            if (no_of_box % 2 == 1) {
                alert('Pair not found');
            }
        });
    }
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
    $("#options-matrix").mousemove(function (event) {
        $().pairHover();
    });
    $().setAnsMatirxSize();
    $().pasteOptions();
    $().selectOptions();
    $().addOption();
    $().removeOption();
    $().pairHover();


    $.contextMenu({
        selector: '#options-matrix .col-filled',
        callback: function (key, options) {
            if (key == 'delete') {
                this.find('.content').removeAttr('data-key');
                var unitPair = this.find('.content').data('pair');
                if ($('#options-matrix [data-pair="' + unitPair + '"]').length == 1) {
                    odd_even = 1;
                }
                $('#options-matrix [data-pair="' + unitPair + '"]').closest('td').removeClass('col-filled');
                $('#options-matrix [data-pair="' + unitPair + '"]').closest('td').html('<div class="content">Empty</div>');
                if (odd_even == 2) {
                    $('#options-container tr').each(function (e) {
                        $(this).css('pointer-events', 'none');
                    });
                } else {
                    $('#options-container tr').each(function (e) {
                        $(this).css('pointer-events', 'auto');
                    });
                }
            }
        },
        items: {
            delete: {name: "Delete", icon: "delete"},
        }
    });
    $('#question-submit-btn').on('click', function (e) {

        //collecting options
        var options = '';
        $('#options-container .op-item .content').each(function (e) {
            options += $(this).data('key') + '=>' + $(this).text() + '|';
        });
        $('#question-options').val(options);

        //collection matrix data
        var matrixDatas = '';
        $('#options-matrix .col-filled .content').each(function (e) {
            matrixDatas += $(this).data('key') + '=>' + $(this).text() + '=>' + $(this).data('pair') + '=>' + $(this).data('yposition') + '=>' + $(this).data('xposition') + '|';
        });
        $('#question-matrix-field').val(matrixDatas);

    });
});

