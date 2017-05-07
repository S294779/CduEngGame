@extends('AdminSite.layouts.main')
@section('breadcrumb')
<li><a class="btn btn-link" href="{{url('/admin')}}">Home</a></li>
<li><a class="btn btn-link" href="{{url('/admin/group/index')}}">All Groups</a></li>
@endsection
@section('content')

<div class="detail-page">
    <p>
        <a class="btn btn-primary" href="{{url('admin/group/update',$model->id)}}">Update</a>
        <a class="btn btn-danger" data-method='post' href="{{url('admin/group/delete',$model->id)}}">Delete</a>
    </p>
    <table class="table table-bordered" id="group-datail-table">
        <tr>
            <td style="width: 200px">Group Name</td><td>{{$model->group_name}}</td>
        </tr>
        <tr>
            <td style="width: 200px">Group Description</td><td>{{$model->group_description}}</td>
        </tr>
        <tr>
            <td style="width: 200px">Student in this group</td><td>
                <table class="table table-bordered">
                    <tr>
                        <th>#</th>
                        <th>Name</th>
                        <th>Email</th>
                    </tr>
                    @php
                        $stCount = 1;
                    @endphp
                    @foreach($model->student as $student)
                    <tr>
                        <td>
                            {{$stCount}}
                        </td>
                        <td>
                            {{$student->name}}
                        </td>
                        <td>
                            {{$student->email}}
                        </td>
                    </tr>
                    @php
                        $stCount++;
                    @endphp
                    @endforeach
                </table>
            </td>
        </tr>
    </table>
</div>
@endsection
