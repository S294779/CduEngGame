@extends('AdminSite.layouts.main')
@section('breadcrumb')
<li><a class="btn btn-link" href="{{url('/admin')}}">Home</a></li>
<li><a class="btn btn-link" href="{{url('/admin/student/index')}}">All Students</a></li>
@endsection
@section('content')
<form action="{{($model->id)?url('/admin/student/update',$model->id): url('/admin/student/create') }}" method="post">
    {{ csrf_field() }}
    <div class="form-group {{ $errors->has('name') ? ' has-error' :($errors->any()?'has-success':'')}}">
        <label class="control-label">Name</label>
        <input type="text" name="name" value="{{old('name',$model->name)}}" class="form-control">
        @if ($errors->has('name'))
            <span class="help-block">
                <strong>{{ $errors->first('name') }}</strong>
            </span>
        @endif
    </div>
    <div class="form-group {{ $errors->has('email') ? ' has-error' :($errors->any()?'has-success':'')}}">
        <label class="control-label">Email</label>
        <input type="email" name="email" value="{{old('email',$model->email)}}" class="form-control">
        @if ($errors->has('email'))
            <span class="help-block">
                <strong>{{ $errors->first('email') }}</strong>
            </span>
        @endif
    </div>
    <div class="form-group {{ $errors->has('group_id') ? ' has-error' :($errors->any()?'has-success':'')}}">
        <label class="control-label">Group</label>
        <select name="group_id" class="form-control select2-seach">
            <option value="">Select Group</option>
            @php
                foreach($groupModels as $groupModel){
                    if($groupModel->id == $model->group_id){
                        $selected = 'selected';
                    }else{
                        $selected = '';
                    }
            @endphp
            <option value="{{$groupModel->id}}" {{$selected}} >{{$groupModel->group_name}}</option>
            @php
                }
            @endphp
        </select>
        @if ($errors->has('group_id'))
            <span class="help-block">
                <strong>{{ $errors->first('group_id') }}</strong>
            </span>
        @endif
    </div>
    @php
        $update = ($model->id)?false:true;
        if($update){
    @endphp
    <div class="form-group {{ $errors->has('password') ? ' has-error' :($errors->any()?'has-success':'')}}">
        <label class="control-label">Password</label>
        <input type="password" name="password" value="{{old('password',$model->password)}}" class="form-control">
        @if ($errors->has('password'))
            <span class="help-block">
                <strong>{{ $errors->first('password') }}</strong>
            </span>
        @endif
    </div>
    @php
        }
    @endphp
    <div class="form-group">
        <button type="submit" class="btn {{($model->id)?'btn-primary':'btn-success'}}">{{($model->id)?'Update':'Create'}}</button>
    </div>
</form>
@endsection
