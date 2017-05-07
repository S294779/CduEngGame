$(function () {
    var notification = new Audio('media/first-select.mp3');
    
    $.fn.loadMessage = function (options) {
        
        $.ajax({
            url: 'load-chat-message',
            type: 'post',
            success: function (response) {
                $('.chat-content').html('');
                var cnt = 0;
                var rMsg = 0;

                $.each(response, function (key, val) {
                    if(val.seen_status == 'unseen'){
                        var fontweight = 700;
                    }else{
                        var fontweight = 400;
                    }
                    var html = '<div class="row ' + val.messagetype + '" >';
                    html += '<div style="' + val.nameAlign + ';color:#4cae4c"><b>'
                    html += val.student;
                    html += '</div></b>';
                    html += '<div class="' + val.seen_status + '" data-gmsgu="'+val.gmsgu_id+'" style="clear:both;font-weight:'+fontweight+';white-space: pre-wrap">'
                    html += val.message;
                    html += '</div>';
                    html += '</div>';
                    var Container = $('.chat-content');
                    Container.append(html);
                    if(options.scrollButtom == true){
                        var height = Container[0].scrollHeight;
                        Container.scrollTop(height);
                    }
                    if(val.seen_status == 'unseen' && val.messagetype == 'receipt-message'){
                       cnt++; 
                    }
                    rMsg++;
                })
                if (cnt > 0) {
                    $('.chat-new-notification').text(cnt);
                    notification.play();
                }else{
                    $('.chat-new-notification').text('');
                }
                if(rMsg > 0){
                    var gmsgCollection1 = [];
                    if (!$('#chat-main-box').hasClass('navbar-fixed-bottom-small')) {
                            $('.scrollbar .receipt-message .unseen').each(function (e) {
                                if ($(this).visible()) {
                                    gmsgCollection1.push({
                                        gmsg:$(this).data('gmsgu'),
                                        m:$(this).html()
                                    });
                                    $(this).removeClass('unseen');
                                    $(this).animate({
                                        'font-weight':400
                                    },1000);
                                }
                            });
                            $.ajax({
                                url:'set-seen-msg',
                                type:'post',
                                data:{
                                    data:gmsgCollection1
                                },
                                success:function(response){
                                    gmsgCollection1 = [];
                                }
                            });
                    }
                }
            }
        });
    }

    $.fn.postMessage = function (options) {
        $('#chat-message-form').submit(function (e) {
            $.ajax({
                url: $(this).attr('action'),
                data: $(this).serialize(),
                type: 'post',
                success: function (response) {
                    $('#chat-message-form-reset').click();
                    $().loadMessage({
                        scrollButtom:true
                    });
                }
            });
            return false;
        });
    }
    $.fn.manageChatWindow = function (options) {
        var gmsgCollection = [];
        if (typeof (Storage) !== "undefined") {
            localStorage.setItem('cdu-navbar-fixed-bottom-small', 1);
        } else {
            window.alert('Please use a modern browser to properly view this template!');
        }
        $('#chat-display-btn').on('click', function (e) {
            if ($('#chat-main-box').hasClass('navbar-fixed-bottom-small')) {
                $('#chat-main-box').removeClass('navbar-fixed-bottom-small');
                localStorage.setItem('cdu-navbar-fixed-bottom-small', 0);
                $('.chat-group-name').show();
                $('.chat-new-notification').hide();
                $('#chat-display-btn').removeClass('fa-window-maximize');
                $('#chat-display-btn').addClass('fa-window-restore');
            } else {
                $('#chat-main-box').addClass('navbar-fixed-bottom-small');
                localStorage.setItem('cdu-navbar-fixed-bottom-small', 1);
                $('.chat-group-name').hide();
                $('.chat-new-notification').show();
                $('#chat-display-btn').removeClass('fa-window-restore');
                $('#chat-display-btn').addClass('fa-window-maximize');
            }
        });
        $(".scrollbar").scroll(function () {
            if (!$('#chat-main-box').hasClass('navbar-fixed-bottom-small')) {
                $('.scrollbar .receipt-message .unseen').each(function (e) {
                    if ($(this).visible()) {
                        gmsgCollection.push({
                            gmsg:$(this).data('gmsgu'),
                            m:$(this).html()
                        });
                        $(this).removeClass('unseen');
                        $(this).animate({
                            'font-weight':400
                        },1000);
                    }
                });
            }
        });
        $('[name="message"]').on('click',function(e){
            $.ajax({
                url:'set-seen-msg',
                type:'post',
                data:{
                    data:gmsgCollection
                },
                success:function(response){
                    gmsgCollection = [];
                }
            });
        });
    }
    $().loadMessage({
        scrollButtom:true
    });
    $().postMessage();
    $().manageChatWindow();
    setInterval(function () {
        $().loadMessage({
            scrollButtom:false
        });
    }, 10000);
});