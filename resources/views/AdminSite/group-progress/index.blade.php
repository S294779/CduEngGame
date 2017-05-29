@extends('AdminSite.layouts.main')
@section('breadcrumb')
<li><a class="btn btn-link" href="{{url('/admin')}}">Home</a></li>
@endsection
@section('content')
<style>
    .progress{
        cursor: pointer
    }
    .progress-detail > .col-sm-12{
        background: #d7f9fd;
        border: 1px solid #7be8d4;
        border-radius: 5px;
    }
</style>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/velocity/1.5.0/velocity.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/velocity/1.5.0/velocity.ui.min.js"></script>
<script type="text/javascript" src="{!! asset('js/modal.animate.js') !!}"></script>
<div class="panel panel-default">
    <div class="panel-heading"><b>Group Progress</b></div>
    <div2 class="panel-body">
        <div class="row">
            @foreach($models as $model)
            <div class="col-sm-12 progress-container">
                <div class="col-sm-12"><b>{{$model->group_name}}</b></div>
                <div class="col-sm-12">
                    @php
                    $acrive = 'active';    
                    if($model->matched_percentage == 100){
                    $acrive = '';
                    $progressClass = 'progress-bar-success';

                    }elseif($model->matched_percentage >= 20){

                    $progressClass = 'progress-bar-primary';

                    }elseif($model->matched_percentage > 5){

                    $progressClass = 'progress-bar-warning';

                    }else{
                    $progressClass = 'progress-bar-danger';
                    }
                    @endphp
                    <div class="progress progress-sm {{$acrive}}" style="margin-bottom: 5px;">
                        <div class="progress-bar {{$progressClass}} progress-bar-striped" role="progressbar" aria-valuenow="{{$model->matched_percentage}}" aria-valuemin="0" aria-valuemax="100" style="width: {{$model->matched_percentage}}%" data-toggle="tooltip" title="Click for Detail">
                            <span style="color:#fff">{{$model->matched_percentage}}% Complete</span>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12 progress-detail" style="display: none">
                    <div class="col-sm-12">
                        <div class="row">
                            <div class="col-sm-12"><b><u>Detail</u></b></div>
                        </div>
                        @php
                        $members = json_decode($model->group_members)
                        @endphp
                        @foreach($members as $member)
                        <div class="row">
                            <div class="col-sm-3">Name: {{$member->student_name}}</div>
                            <div class="col-sm-6">Pair Matched: {{$member->answer_count}}</div>
                            <div class="col-sm-3"><a target="_blank" href="{{url('admin/progress-detail',['id'=>$member->student_id])}}"><b>more <i class="fa fa-angle-double-right" aria-hidden="true"></i></b></a></div>
                        </div>
                        @endforeach
                    </div>
                </div>
            </div>
            @endforeach
        </div>
</div>
<div id="firstQuestion" class="modal" data-easein="bounceIn" role="dialog" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <!--<button type="button" class="close" data-dismiss="modal">&times;</button>-->
                <h4 class="modal-title">Extra Question</h4>
            </div>
            <div class="modal-body">
                <form id="extra-ans-correct-review-form" action="{{url('admin/extra-ans-correct')}}" method="post">
                    {{csrf_field()}}
                    <div class="form-group">
                        <div class="row">
                            <div class="col-sm-3"><b>Question (Asked)</b></div>
                            <div class="col-sm-3"><b>Question (submitted)</b></div>
                            <div class="col-sm-3"><b>Answer (submitted)</b></div>
                            <div class="col-sm-3"><b>Is Correct?</b></div>
                        </div>
                    </div>
                    @foreach($pending_extra_anses as $pending_extra_ans)
                    <div class="form-group">
                        <div class="row">
                            <div class="col-sm-3">{{$pending_extra_ans->commonquestion->question}}</div>
                            <div class="col-sm-3">{{$pending_extra_ans->question_text}}</div>
                            <div class="col-sm-3">{{$pending_extra_ans->answer_text}}</div>
                            <div class="col-sm-3">
                                <div class="checkbox" style="margin-top: 0px">
                                    <label style="font-size: 1.2em">
                                        <input type="checkbox" class="main" value="1" name="correct_review[{{$pending_extra_ans->id}}]">
                                        <span class="cr"><i class="cr-icon fa fa-check"></i></span>
                                    </label>
                                    <input type="checkbox" class="auxiliary" style="display:none" value="2" name="correct_review[{{$pending_extra_ans->id}}]" checked="checked">
                                </div>
                            </div>
                        </div>
                    </div>
                    @endforeach
                </form>
            </div>
            <div class="modal-footer">
                <input type="submit" form="extra-ans-correct-review-form" class="btn btn-success" value="Save">
            </div>
        </div>
    </div>
</div>
<script>
$(document).ready(function (e) {
    $('.progress').on('click', function (e) {
        $(this).closest('.progress-container').find('.progress-detail').slideToggle();
    });
    $('[data-toggle="tooltip"]').tooltip();
});
</script>
@if(count($pending_extra_anses)>0)
<script>
    $(document).ready(function (e) {
        $('.main').on('click', function (e) {

            if ($(this).is(':checked')) {
                $(this).closest('.checkbox').find('.auxiliary').attr('checked', false);
            } else {
                $(this).closest('.checkbox').find('.auxiliary').attr('checked', true);
            }
        })
        $('#firstQuestion').modal('show');
        $('#extra-ans-correct-review-form').submit(function (e) {
            var result = confirm('Are you sure you want to save?');
            if (result) {

            } else {
                return false;
            }
        });
    });
</script>
@endif
@endsection
