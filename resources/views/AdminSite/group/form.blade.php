@extends('AdminSite.layouts.main')
@section('breadcrumb')
<li><a class="btn btn-link" href="{{url('/admin')}}">Home</a></li>
<li><a class="btn btn-link" href="{{url('/admin/group/index')}}">All Groups</a></li>
@endsection
@section('content')

<form action="{{($model->id)?url('/admin/group/update',$model->id): url('/admin/group/create') }}" method="post">
    {{ csrf_field() }}
    <div class="form-group {{ $errors->has('group_name') ? ' has-error' :($errors->any()?'has-success':'')}}">
        <label class="control-label">Group Name</label>
        <input type="text" name="group_name" value="{{old('group_name',$model->group_name)}}" class="form-control">
        @if ($errors->has('group_name'))
            <span class="help-block">
                <strong>{{ $errors->first('group_name') }}</strong>
            </span>
        @endif
    </div>
    <div class="form-group {{ $errors->has('group_description') ? ' has-error' : ($errors->any()?'has-success':'') }}">
        <label class="control-label">Group Description</label>
        <textarea class="form-control" name="group_description" rows="4">{{old('group_description',$model->group_description)}}</textarea>
        @if ($errors->has('group_description'))
            <span class="help-block">
                <strong>{{ $errors->first('group_description') }}</strong>
            </span>
        @endif
    </div>
    <div class="form-group">
        <button type="submit" class="btn {{($model->id)?'btn-primary':'btn-success'}}">{{($model->id)?'Update':'Create'}}</button>
    </div>
</form>
@endsection
