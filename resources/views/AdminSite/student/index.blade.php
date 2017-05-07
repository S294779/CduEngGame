@extends('AdminSite.layouts.main')
@section('breadcrumb')
<li><a class="btn btn-link" href="{{url('/admin')}}">Home</a></li>
@endsection
@section('content')
<p>
        <a class="btn btn-success" href="{{url('admin/student/create')}}">Create</a>
</p>
<p class="summary">Showing {{$models->firstItem()}}-{{$models->lastItem()}} of {{$models->total()}} items</p>
<table class="table table-bordered">
    <thead>
        <tr>
            <th>#</th>
            <th>Name</th>
            <th>Email</th>
            <th>Actions</th>
        </tr>
    </thead>
    @php
        $count = 1;
    @endphp
    @foreach ($models as $model)
    <tr>
        <td>{{$count}}</td>
        <td>{{ $model->name }}</td>
        <td>{{ $model->email }}</td>
        <td>
            <a class="action-link" href="{{url('/admin/student/view',$model->id)}}"><i class="fa fa-eye"></i></a>
            <a class="action-link" href="{{url('/admin/student/update',$model->id)}}"><i class="fa fa-edit"></i></a>
            <a class="action-link" data-method="post" href="{{url('/admin/student/delete',$model->id)}}"><i class="fa fa-trash"></i></a>
        </td>
    </tr>
        @php 
            $count++;
        @endphp
    @endforeach
</table>

    {{ $models->links() }}
@endsection
