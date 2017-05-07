@extends('AdminSite.layouts.main')
@section('breadcrumb')
<li><a class="btn btn-link" href="{{url('/admin')}}">Home</a></li>
<li><a class="btn btn-link" href="{{url('/admin/common-question/index')}}">All Common Questions</a></li>
@endsection
@section('content')
<style>
    .form-group input[type="checkbox"] {
        display: none;
    }

    .form-group input[type="checkbox"] + .btn-group > label span {
        width: 20px;
    }

    .form-group input[type="checkbox"] + .btn-group > label span:first-child {
        display: none;
    }
    .form-group input[type="checkbox"] + .btn-group > label span:last-child {
        display: inline-block;   
    }

    .form-group input[type="checkbox"]:checked + .btn-group > label span:first-child {
        display: inline-block;
    }
    .form-group input[type="checkbox"]:checked + .btn-group > label span:last-child {
        display: none;   
    }
</style>
<form action="{{($model->id)?url('/admin/common-question/update',$model->id): url('/admin/common-question/create') }}" method="post">
    {{ csrf_field() }}
    <div class="row">
        <div class="col-sm-10">
            <div class="form-group {{ $errors->has('question') ? ' has-error' :($errors->any()?'has-success':'')}}">
                <label class="control-label">Question</label>
                <input type="text" name="question" value="{{old('question',$model->question)}}" class="form-control">
                @if ($errors->has('question'))
                <span class="help-block">
                    <strong>{{ $errors->first('question') }}</strong>
                </span>
                @endif
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-10">
            <div class="form-group">
                <div class="[ form-group ]">
                    <input type="checkbox" name="is_asked" value="1" {!!($model->is_asked == 1)?'checked':''!!} id="fancy-checkbox-primary" autocomplete="off" />
                    <div class="[ btn-group ]">
                        <label for="fancy-checkbox-primary" class="[ btn btn-primary ]">
                            <span class="[ glyphicon glyphicon-ok ]"></span>
                            <span> </span>
                        </label>
                        <label for="fancy-checkbox-primary" class="[ btn btn-default active ]">
                            Is Asked
                        </label>
                    </div>
                </div>
            </div>
        </div>

    </div>


    <div class="form-group">
        <button type="submit" id="question-submit-btn" class="btn {{($model->id)?'btn-primary':'btn-success'}}">{{($model->id)?'Update':'Create'}}</button>
    </div>
</form>
@endsection

