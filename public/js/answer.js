$(function () {
    var selectTone1 = undefined;
    var selectTone2 = undefined;
    var unmatched = undefined;
    var success = undefined;
    var onlyoneOccur = undefined;
    var timeTaken = '';

    $.fn.loadSound = function (options) {

        var volume = parseFloat($('#valume-change').val() / 100).toFixed(2);

        if (selectTone1 == undefined) {
            selectTone1 = new Audio('media/first-select.mp3');
            selectTone1.volume = volume;
        }
        if (selectTone2 == undefined) {
            selectTone2 = new Audio('media/second-select.mp3');
            selectTone2.volume = volume;
        }
        if (unmatched == undefined) {
            unmatched = new Audio('media/unmatched.mp3');
            unmatched.volume = volume;
        }
        if (success == undefined) {
            success = new Audio('media/success.mp3');
            success.volume = volume;
        }
    }

    $('input[type="range"]').ionRangeSlider({
        type: "single",
        min: 0,
        max: 100,
        step: 1,
        onFinish: function (data) {

            selectTone1.volume = data.from / 100;
            selectTone2.volume = data.from / 100;
            unmatched.volume = data.from / 100;
            success.volume = data.from / 100;
            if (typeof (Storage) !== "undefined") {
                localStorage.setItem('cdu-game-volume', data.from);
            } else {
                window.alert('Please use a modern browser to properly view this template!');
            }
        },
    });

    $.fn.answerFunction = function (options) {

        var matchedCount = options.matchedCount;
        var single_or_double = 1;
        var firstElement = {};
        var secondElement = {};
        var matchedItemCollection = [];
        var uniquePair = '';

//        if ($('#answer-matrix .not-col-matched').length == 0) {
//            $('#game-over-text-overlay').show();
//        }

        $('#answer-matrix .not-col-matched').off().on('click', function (e) {

            if ($(this).hasClass('col-matched')) {
                return false;
            }
            options.runObj.runner('start');
            
            timeTaken = options.runObj.runner('info').formattedTime;
            if (single_or_double == 1) {
                uniquePair = $.now();
                firstElement = $(this);
                firstElement.css({
                    'background-color': '#fff',
                    'color': '#000'
                });
                selectTone1.play();
                single_or_double = 2;

            } else {
                single_or_double = 1;
                secondElement = $(this);
                secondElement.css({
                    'background-color': '#fff',
                    'color': '#000'
                });
                var fKey = firstElement.find('.content').data('key');
                var FK = fKey.split('][');
                var FK1 = FK[0];
                var FK2 = FK[1];

                var sKey = secondElement.find('.content').data('key');
                var SK = sKey.split('][');
                var SK1 = SK[0];
                var SK2 = SK[1];

                if (FK1 == SK1 && FK2 != SK2) {

                    
                    firstElement.addClass('col-matched');
                    firstElement.removeClass('not-col-matched');
                    firstElement.find('.content').attr('data-pair', uniquePair);
                    secondElement.addClass('col-matched');
                    secondElement.removeClass('not-col-matched');
                    secondElement.find('.content').attr('data-pair', uniquePair);
                    success.play();

                    if ($('#answer-matrix .not-col-matched').length == 0) {
                        
                        //$('#firstQuestion').find('#popup-question').text(options.questions.question);
                        window.setTimeout(function(){
                            $('#extra-question-id').val(options.questions.id);
                            $('#firstQuestion').modal('show');
                            $('#extra-ans-modal-btn').show();
                        },1000);
                        
                    }

                    var currentTime = options.runObj.runner('info');
                    $().flyingText({
                        pos: {
                            x: e.pageX,
                            y: e.pageY,
                        },
                        runnerinfo: currentTime
                    });

                    matchedCount++;
                    //mathed unit collection here
                    matchedItemCollection.push({
                        key: firstElement.find('.content').data('key'),
                        xposition: firstElement.find('.content').data('xposition'),
                        yposition: firstElement.find('.content').data('yposition'),
                        label: firstElement.find('.content').data('label'),
                        uniqueKey: firstElement.find('.content').data('pair'),
                        q: firstElement.find('.content').data('q'),
                        time_taken: timeTaken
                    });
                    matchedItemCollection.push({
                        key: secondElement.find('.content').data('key'),
                        xposition: secondElement.find('.content').data('xposition'),
                        yposition: secondElement.find('.content').data('yposition'),
                        label: secondElement.find('.content').data('label'),
                        uniqueKey: secondElement.find('.content').data('pair'),
                        q: secondElement.find('.content').data('q'),
                        time_taken: timeTaken
                    });
                    if(firstElement.find('.content').data('hint') == 1 || secondElement.find('.content').data('hint') == 1){
                        var matchedHint = $('#answer-matrix .col-matched [data-hint="1"]').length;
                        var subpart = JSON.parse(options.questions.subpart);
                        
                        $('#question-hint-container').html(subpart[matchedHint]);
                        $('#hint-box-modal').modal('show');
                    }
                    $.ajax({
                        url: 'matrix-table-ans',
                        type: 'post',
                        data: {
                            data: matchedItemCollection
                        },
                        success: function (response) {
                            if ($('#answer-matrix .not-col-matched').length == 0) {
//                                options.runObj.runner('stop');
//                                $('#game-over-text-overlay').show();
                            }
                            matchedItemCollection = [];
                            success.play();
                            $('#answer-matrix tr').each(function (e) {
                                $(this).find('td').each(function (e) {
                                    $(this).removeClass('col-matched');
                                    $(this).css({
                                        'background-color': '',
                                        'color': ''
                                    });
                                })
                            });
                            var matchedCnt = 0;
                            $.each(response, function (key, val) {
                                matchedCnt++;
                                $('#answer-matrix tr:nth-child(' + val.yposition + ') td:nth-child(' + val.xposition + ')').addClass('col-matched');
                            });
                            matchedCnt = matchedCnt / 2;
                            $().answerFunction({
                                matchedCount: matchedCnt,
                                questions: options.questions,
                                runObj: options.runObj
                            });
                        }
                    });
                } else {
                    
                    firstElement.removeClass('col-matched');
                    secondElement.removeClass('col-matched');
                    
                    selectTone2.play();
                    setTimeout(function () {
                        $('#answer-matrix .not-col-matched').css({
                            'background-color': '',
                            'color': ''
                        });

                        unmatched.play();
                    }, 500);
                }
            }

        });
    }
    $.fn.beforeSubmit = function (options) {
        $('#extra-question-form').submit(function (e) {
            if ($('[name="answer"]').val() == '') {
                $('[name="answer"]').setErrorMessage({
                    message: "Can't be blanked."
                });
                return false;
            } else {
                $('[name="answer"]').removeErrorMessage();
                if (onlyoneOccur != undefined) {
                    $.ajax({
                        url: 'matrix-table-ans',
                        type: 'post',
                        async: false,
                        data: {
                            data: onlyoneOccur
                        },
                        success: function (response) {
                            options.runObj.runner('start');
                        }
                    });
                }
                $.ajax({
                    url: 'set-extra-ans',
                    type: 'post',
                    async: false,
                    data: $(this).serialize(),
                    success: function (response) {
                        $('#extra-question-form [name="answer"]').val('');
                        $('#firstQuestion').modal('hide');
                        if ($('#answer-matrix .not-col-matched').length == 0) {
                                options.runObj.runner('stop');
                                $('#game-over-text-overlay').show();
                        }
                    }
                });
                return false;
            }
            return false;
        });
    };
    $.fn.flyingText = function (options) {
        var xposition = options.pos.x;
        var yposition = options.pos.y;

        var id = 'fly' + $.now();
        var ftext = $('<span />');
        ftext.attr('id', id);
        ftext.addClass('flying-text');
        ftext.css({
            color: '#0bb722',
            position: 'absolute',
            left: xposition + 'px',
            top: yposition + 'px',
        });
        ftext.html(timeTaken);
        $('body').append(ftext);
        $('body #' + id + '').animate({
            top: '-=50',
            opacity: 0,
        }, 1000);
    }
})


