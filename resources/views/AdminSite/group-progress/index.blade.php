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
<script>
    $(document).ready(function (e) {
        $('.progress').on('click', function (e) {
            $(this).closest('.progress-container').find('.progress-detail').slideToggle();
        });
        $('[data-toggle="tooltip"]').tooltip();
    });
</script>
@endsection
