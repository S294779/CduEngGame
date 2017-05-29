$(function () {
    var odd_even = 1;
    var uniquePair = '';
    var autoFill = 0;
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

                if ($(this).hasClass('col-filled') && autoFill == 0) {
                    alert("You can't overwrite item.");

                } else {
                    if (odd_even == 1) {
                        odd_even = 2;
                        uniquePair = $.now();
                        setTimeout(function(e){},200);
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
             $().pairHover();

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
    $.fn.generateRandomNumber = function (options) {

        return Math.floor(Math.random() * (options.max - options.min + 1) + options.min);
    }
    $.fn.autoFillUp = function (options) {

        $('#auto-fillup-btn').on('click', function (e) {
            e.preventDefault();
            var oldRes = $('#options-container tr').length;
            if (oldRes) {
                autoFill = 1;
                var xPosition = $('#ans-matrix-size-x').val();
                var yPosition = $('#ans-matrix-size-y').val();
                var xPositionArr = [];
                var yPositionArr = [];
                var totalMatrixPosition = [];
                for (var i = 1; i <= xPosition; i++) {
                    xPositionArr.push(i);

                }
                xPositionArr = shuffle(xPositionArr);
                for (var i = 1; i <= yPosition; i++) {
                    yPositionArr.push(i);

                }
                yPositionArr = shuffle(yPositionArr);
                var matrixPositions = [];
                $.each(xPositionArr, function (xkey, xval) {
                    $.each(yPositionArr, function (ykey, yval) {
                        matrixPositions.push([xval, yval]);

                    });
                });

                matrixPositions = shuffle(matrixPositions);
                var countMtrix = 1;
                var rows = $('#options-container tr').length;
                var oprCnt = 1;
                $.each(matrixPositions, function (mKey, mPosition) {


                    if (countMtrix % 2 != 0) {
                        $('#options-container tr:nth-child(' + oprCnt + ') td:nth-child(1)').click();
                        oprCnt++;
                        if (oprCnt > rows) {

                            oprCnt = 1;
                        }

                    } else {

                    }
                    $('#options-matrix tr:nth-child(' + mPosition[1] + ') td:nth-child(' + mPosition[0] + ')').click();
                    countMtrix++;
                });
                autoFill = 0;
            } else {
                alert('There is no option available?');
            }

        });
    }
    function shuffle(array) {
        var currentIndex = array.length, temporaryValue, randomIndex;

        // While there remain elements to shuffle...
        while (0 !== currentIndex) {

            // Pick a remaining element...
            randomIndex = Math.floor(Math.random() * currentIndex);
            currentIndex -= 1;

            // And swap it with the current element.
            temporaryValue = array[currentIndex];
            array[currentIndex] = array[randomIndex];
            array[randomIndex] = temporaryValue;
        }

        return array;
    }
    $().autoFillUp();
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
    $('#main-question-form').submit(function(e){
        var no_options = $('#options-container tr').length;
        if(no_options >= 2){
            
        }else{
            alert('Minimum 2 option pair is required');
            return false;
        }
    })
});

