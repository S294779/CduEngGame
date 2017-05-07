@extends('AdminSite.layouts.main')
@section('breadcrumb')
<li><a class="btn btn-link" href="{{url('/admin')}}">Home</a></li>
<li><a class="btn btn-link" href="{{url('/admin/student/index')}}">All Students</a></li>
@endsection
@section('content')
<div class="detail-page">
    <p>
        <a class="btn btn-primary" href="{{url('admin/student/update',$model->id)}}">Update</a>
        <a class="btn btn-danger" data-method='post' href="{{url('admin/student/delete',$model->id)}}">Delete</a>
    </p>
    <table class="table table-bordered" id="group-datail-table">
        <tr>
            <td style="width: 200px">Name</td><td>{{$model->name}}</td>
        </tr>
        <tr>
            <td style="width: 200px">Email</td><td>{{$model->email}}</td>
        </tr>
        <tr>
            <td style="width: 200px">Group</td><td>{{$groupModel->group_name}}</td>
        </tr>
    </table>
</div>
@endsection
