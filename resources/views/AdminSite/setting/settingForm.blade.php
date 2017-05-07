@extends('AdminSite.layouts.main')
@section('breadcrumb')
<li><a class="btn btn-link" href="{{url('/admin')}}">Home</a></li>
@endsection
@section('content')
<div class="panel panel-default">
    <div class="panel-heading">Change Setting</div>
    <div class="panel-body">
        <form action="" method="post">
            {{ csrf_field() }}
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group {{ $errors->has('max_num_in_group') ? ' has-error' :($errors->any()?'has-success':'')}}">
                        <label class="control-label">Maximum Number in a group</label>
                        <input type="text" name="max_num_in_group" value="{{old('max_num_in_group',$model->max_num_in_group)}}" class="form-control">
                        @if ($errors->has('max_num_in_group'))
                        <span class="help-block">
                            <strong>{{ $errors->first('max_num_in_group') }}</strong>
                        </span>
                        @endif
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group {{ $errors->has('flip_game_window_size') ? ' has-error' :($errors->any()?'has-success':'')}}">
                        <label class="control-label">Flip Game Window Size(default)</label>
                        <input data-inputmask='"mask":"99X9[9]"' data-mask type="text" name="flip_game_window_size" value="{{old('flip_game_window_size',$model->flip_game_window_size)}}" class="form-control">
                        @if ($errors->has('flip_game_window_size'))
                        <span class="help-block">
                            <strong>{{ $errors->first('flip_game_window_size') }}</strong>
                        </span>
                        @endif
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group {{ $errors->has('email_sending_day') ? ' has-error' :($errors->any()?'has-success':'')}}">
                        <label class="control-label">Email Sending Day</label>
                        <select name="email_sending_day[]" class="form-control days-seach" multiple="multiple">
                                <option value="">Select Day</option>
                            @foreach($model->getDayNames() as $day)
                                @php
                                    $selected = '';
                                    if(in_array($day,$model->email_sending_day)){
                                        $selected = 'selected';
                                    }
                                @endphp
                                <option value="{{$day}}" {{$selected}}>{{$day}}</option>
                            @endforeach
                        </select>
                        @if ($errors->has('email_sending_day'))
                        <span class="help-block">
                            <strong>{{ $errors->first('email_sending_day') }}</strong>
                        </span>
                        @endif
                    </div>
                </div>
            </div>
            <div class="form-group">
                <button class="btn btn-primary" type="submit">Save</button>
            </div>
        </form>
    </div>
</div>

<script>
    $("[data-mask]").inputmask();

</script>
@endsection
