@extends('AdminSite.layouts.main')
@section('breadcrumb')
<li><a class="btn btn-link" href="{{url('/admin')}}">Home</a></li>
@endsection
@section('content')

<p>
        <a class="btn btn-success" href="{{url('admin/group/create')}}">Create</a>
</p>
<p class="summary">Showing {{$models->firstItem()}}-{{$models->lastItem()}} of {{$models->total()}} items</p>
<table class="table table-bordered">
    <thead>
        <tr>
            <th>#</th>
            <th>Group Name</th>
            <th>Group Description</th>
            <th>Is Release</th>
            <th>Actions</th>
        </tr>
    </thead>
    @php
        $count = 1;
    @endphp
    @foreach ($models as $model)
    <tr>
        <td>{{$count}}</td>
        <td>{{ $model->group_name }}</td>
        <td>{{ $model->group_description }}</td>
        <td>{!! ($model->release_group==1)?'<i class="fa fa-check text-success"></i>':'<i class="fa fa-remove text-danger"></i>' !!}</td>
        <td>
            <a class="action-link" href="{{url('/admin/group/view',$model->id)}}"><i class="fa fa-eye"></i></a>
            <a class="action-link" href="{{url('/admin/group/update',$model->id)}}"><i class="fa fa-edit"></i></a>
            <a class="action-link" data-method="post" href="{{url('/admin/group/delete',$model->id)}}"><i class="fa fa-trash"></i></a>
        </td>
    </tr>
        @php 
            $count++;
        @endphp
    @endforeach
</table>

    {{ $models->links() }}
@endsection
