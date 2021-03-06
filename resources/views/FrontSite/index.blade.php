@extends('FrontSite.layouts.main')
@section('content')
<style>

    #answer-matrix td {
        position:relative;
        text-align:center;
        color: #00b3ee
    }
    #answer-matrix .content{
        vertical-align: text-top;
        margin-bottom: 50%;
        margin-top: 50%;
        text-align:center;
    }
    #answer-matrix .col-matched{
        background: #fff;
        color: #000;
    }
    #answer-matrix .pair-matched{
        background-color:#1ce2ab
    }

    .noselect {
        -webkit-touch-callout: none; /* iOS Safari */
        -webkit-user-select: none; /* Safari */
        -khtml-user-select: none; /* Konqueror HTML */
        -moz-user-select: none; /* Firefox */
        -ms-user-select: none; /* Internet Explorer/Edge */
        user-select: none; /* Non-prefixed version, currently
                              supported by Chrome and Opera */
    }
    #answer-matrix td{
        cursor: pointer;
    }
    #answer-matrix td:hover{
        //background-color: #1ce2ab;
    }
    #game-over-text-overlay{
        position: absolute;
        height: 100%;
        width: 88%;
        text-align: center;
        font-size: 58px;
        z-index: 500;
        /* vertical-align: middle; */
        opacity: 0.7;
        padding: 20%; 
    }
</style>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/velocity/1.5.0/velocity.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/velocity/1.5.0/velocity.ui.min.js"></script>
<script type="text/javascript" src="{!! asset('js/modal.animate.js') !!}"></script>
<script type="text/javascript" src="{!! asset('js/answer.js') !!}"></script>
<div class="container">

    <div class="row" style="margin-top: 50px;">
        <div id="game-over-text-overlay" style="display: none">
            Game over
        </div>
        <div class="col-sm-12 noselect" style="overflow-x: scroll;">
            <div class="col-sm-12">
                <h4 style="text-align: center">{{$question->question}}</h4>
            </div>
            <div class="col-sm-12" style="padding: 15px; background-color: #00b3ee">
                <table id="answer-matrix" class="table table-bordered" style="table-layout: fixed;margin-bottom: 0px;">
                    @php
                    $matched = 0;
                    for($i = 1; $i<=$question->ans_matrix_size_y;$i++){
                    @endphp
                    <tr>
                        @for($j = 1; $j<=$question->ans_matrix_size_x;$j++)
                        @php
                        $content = '<div class="content">Empty</div>';
                    $matrixClass = '';

                    foreach($matrixDatas as $matrixData){
                    if($matrixData['xposition'] == $j && $matrixData['yposition'] == $i){
                    $content = '<div class="content" data-q="'.$question->id.'" data-key="['.$matrixData['first_pair'].']['.$matrixData['second_pair'].']" data-yposition="'.$matrixData['yposition'].'" data-xposition="'.$matrixData['xposition'].'" data-label="'.$matrixData['label'].'" data-hint="'.$matrixData['hint'].'">'.$matrixData['label'].'</div>';
                    $matrixClass = 'not-col-matched';
                    foreach($matrixDatasAns as $matrixDatasAn){
                    if($matrixData->xposition == $matrixDatasAn->xposition && $matrixData->yposition == $matrixDatasAn->yposition && $matrixData->label == $matrixDatasAn->label ){
                    $matrixClass = 'col-matched';
                    $matched++;
                    break;
                    }

                    }
                    }
                    }
                    @endphp
                    <td class="{{$matrixClass}}" >{!!$content!!}</td>
                    @endfor
                    </tr>
                    @php
                    }
                    @endphp
                </table>
            </div>
        </div>
    </div>
    <button type="button" id="extra-ans-modal-btn" class="btn btn-primary pull-right" data-toggle="modal" data-target="#firstQuestion" style="display: none">Final Question</button>
    
</div>
<div id="firstQuestion" class="modal" data-easein="bounceIn" role="dialog" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <!--<button type="button" class="close" data-dismiss="modal">&times;</button>-->
                <h4 class="modal-title">Final Question</h4>
            </div>
            <div class="modal-body">
                <form id="extra-question-form" action="{{url('set-extra-ans')}}" method="post">
                    {{csrf_field()}}
                    <input type="hidden" name="common_question_id" id="extra-question-id" value="">
                    <input type="hidden" name="question_id" value="{{$question->id}}">
                    <div class="form-group">
                        <label class="control-label" id="popup-question">What may be the question of hints those are shown your team?</label>
                        <input type="text" name="question" class="form-control" placeholder="question here">
                    </div>
                    <div class="form-group">
                        <input type="text" name="answer" class="form-control" placeholder="answer here">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <input type="submit" form="extra-question-form" class="btn btn-success" value="Save">
                <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">Close</button>
            </div>
        </div>
    </div>
</div>

<div id="hint-box-modal" class="modal" data-easein="bounceIn" data-easeout="bounceIn"  role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">Question Hint</h4>
            </div>
            <div class="modal-body">
                <p id="question-hint-container"></p>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">Close</button>
            </div>
        </div>
    </div>
</div>

@php
$gpMembers = '';
foreach($members as $member){
$gpMembers .= "<div style='color:#000'>".$member->name."</div>";
}
@endphp
<div id="chat-main-box" class="navbar-fixed-bottom">
    <div class="col-sm-12">
        <div class="row">
            <a class="btn btn-block btn-success" style="border-radius: 0px;white-space: normal;">
                <span class="chat-group-name"
                      tabindex="0"
                      class="btn btn-lg btn-primary" 
                      role="button" 
                      data-html="true" 
                      data-toggle="popover" 
                      data-trigger="hover" 
                      data-placement="top"
                      title="<b style='color:#000'>Group Members</b>" 
                      data-content="{{$gpMembers}}">{{$groupModel->group_name}}</span>
                <span class="chat-new-notification"></span>
                <i id="chat-display-btn" class="fa fa-window-restore"></i>
            </a>
        </div>
    </div>

    <div id="small-dark" class="col-sm-12 scrollbar chat-content" style="width: 100%">

    </div>
    <div class="clearfix"></div>
    <form id="chat-message-form" method="post" action="{{url('/post-chat-message')}}">
        <div class="col-sm-12" style="background: #f5f5f5;">
            <div class="row" style=" margin-left: -5px;margin-right: -5px;">
                <textarea name="message" class="form-control" style="resize: vertical;"></textarea>
            </div>
        </div>
        <div class="col-sm-12" style="background: #f5f5f5;">
            <div class="row" style=" margin-left: -5px;margin-right: -5px;">
                <button class="btn btn-primary btn-block" type="submit" name="">Send</button>
            </div>
        </div>
        <input type="reset" id="chat-message-form-reset" value="Reset" style="display: none">
    </form>
    <script>
        if (localStorage.getItem('cdu-navbar-fixed-bottom-small') == 1){
var chatBox = document.getElementById('chat-main-box');
        chatBox.className += ' navbar-fixed-bottom-small';
        var chatBoxBtn = document.getElementById('chat-display-btn');
        chatBoxBtn.className = 'fa fa-window-maximize';
        var labels = document.getElementsByClassName('chat-group-name');
        for (var i = 0; i < labels.length; i ++) {
labels[i].style.display = 'none';
        }

var chatNotification = document.getElementsByClassName('chat-new-notification');
        for (var i = 0; i < chatNotification.length; i ++) {
chatNotification[i].style.display = 'inline-block';
        }

} else{

var chatBoxBtn = document.getElementById('chat-display-btn');
        chatBoxBtn.className = 'fa fa-window-restore';
        var labels = document.getElementsByClassName('chat-group-name');
        for (var i = 0; i < labels.length; i ++) {
labels[i].style.display = 'inline-block';
        }

var chatNotification = document.getElementsByClassName('chat-new-notification');
        for (var i = 0; i < chatNotification.length; i ++) {
chatNotification[i].style.display = 'none';
        }
}
$("[data-toggle=popover]").popover();</script>
</div>
@php
$matched = $matched/2;
@endphp

<script src='https://cdnjs.cloudflare.com/ajax/libs/jstimezonedetect/1.0.4/jstz.min.js'></script>
<script type="text/javascript" src="{!! asset('js/chat.js') !!}"></script>
<script>
        $(document).ready(function () {
                var timeZone = jstz.determine().name();
                var oldtimeZne = '{{Auth::user()->timezone}}';
                if (oldtimeZne != timeZone){
                        $.ajax({
                                url:'set-time-zone',
                                type:'post',
                                data:{
                                timezone:timeZone
                                },
                                success:function(response){
                                location.reload();
                                }
                        });
                }
                $().loadSound();
                    var runObj = $('#game-played-time').runner({
                    startAt: 0,
                });
                $().answerFunction({
                        matchedCount: {{$matched}},
                        questions:{!!json_encode($commonQuestion)!!},
                        runObj:runObj
                });
                $().beforeSubmit({
                        runObj:runObj
                });
        });
</script>
@if($submit_extra_ans == 0)
<script>
        $(document).ready(function () {
            if($('#answer-matrix .not-col-matched').length == 0){
                window.setTimeout(function(){
                    $('#extra-question-id').val({!!$commonQuestion['id']!!});
                    $('#firstQuestion').modal('show');
                },1000)
                $('#extra-ans-modal-btn').show();
            }
        });
</script>
@else
<script>
    $(document).ready(function () {
        $('#game-over-text-overlay').show();
        
    });
</script>
@endif
@endsection