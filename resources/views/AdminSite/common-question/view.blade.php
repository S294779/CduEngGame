@extends('AdminSite.layouts.main')
@section('breadcrumb')
<li><a class="btn btn-link" href="{{url('/admin')}}">Home</a></li>
<li><a class="btn btn-link" href="{{url('/admin/common-question/index')}}">All Common Questions</a></li>
@endsection
@section('content')
<div class="detail-page">
    <p>
        <a class="btn btn-primary" href="{{url('admin/common-question/update',$model->id)}}">Update</a>
        <a class="btn btn-danger" data-method='post' href="{{url('admin/common-question/delete',$model->id)}}">Delete</a>
    </p>
    <table class="table table-bordered" id="group-datail-table">
        <tr>
            <td style="width: 200px">Question</td><td>{{$model->question}}</td>
        </tr>
    </table>
</div>
<script type="text/javascript" src="{!! asset('js/questionDetail.js') !!}"></script>
@endsection
