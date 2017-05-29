@extends('AdminSite.layouts.main')
@section('breadcrumb')
<li><a class="btn btn-link" href="{{url('/admin')}}">Home</a></li>
@endsection
@section('content')
<style>
    .first-field{
        /* Firefox */
        width: -moz-calc(40% - 10px);
        /* WebKit */
        width: -webkit-calc(40% - 10px);
        /* Opera */
        width: -o-calc(40% - 10px);
        /* Standard */
        width: calc(40% - 10px);

        float: left
    }
    .second-field{
        width: 40%;
        float: left;
        padding: 0px 10px 0px 10px
    }
    .button-container{
        width: 20%;
        float: left;
        white-space: nowrap;
    }
    .add-btn{
        display: inline-block;
        cursor: pointer
    }
    .add-btn i{
        height: 31px;
        font-size: 34px;
    }
    .remove-btn{
        display: inline-block;
        cursor: pointer
    }
    .remove-btn i{
        height: 31px;
        font-size: 34px;
    }
</style>

<link href="https://cdn.jsdelivr.net/bootstrap.timepicker/0.2.6/css/bootstrap-timepicker.min.css" rel="stylesheet" />
<script type="text/javascript" src="{!! asset('js/bootstrap-timepicker.js') !!}"></script>

<script type="text/javascript" src="{!! asset('js/dynamicForm.js') !!}"></script>


<div class="panel panel-default">
    <div class="panel-heading">Change Setting</div>
    <div class="panel-body">
        <form action="" method="post">
            {{ csrf_field() }}
            <div class="row">
                <div class="col-md-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">General Setting</div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-12">
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
                                <div class="col-md-12">
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
                                <div class="col-md-12">
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
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label">Playing Time</label>
                                </div>
                            </div>
                            <div class="row" id="dyna-field-container">
                                @if(empty($model->playing_time)){
                                <div class="first dyna-fields">
                                    <div class="col-md-12">
                                        <div class="first-field">
                                            <div class="input-group bootstrap-timepicker ">
                                                <input  name="palying_time[0][from]" class="form-control input-group-addon timepicker-input">
                                            </div>
                                        </div>
                                        <div class="second-field">
                                            <div class="input-group bootstrap-timepicker ">
                                                <input  name="palying_time[0][to]" class="form-control input-group-addon timepicker-input">
                                            </div>
                                        </div>
                                        <div class="button-container">
                                            <div class="form-group">
                                                <a class="text-success add-btn"><i class="fa fa-plus-square"></i></a>
                                                <a class="text-danger remove-btn"><i class="fa fa-minus-square"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                @else
                                @php $cnt = 0; $first = 'first'; foreach($model->playing_time as $time){ @endphp
                                    <div class="{{$first}} dyna-fields">
                                        <div class="col-md-12">
                                            <div class="first-field">
                                                <div class="input-group bootstrap-timepicker ">
                                                    <input  name="palying_time[{{$cnt}}][from]" class="form-control input-group-addon timepicker-input" value="{{$time['from']}}">
                                                </div>
                                            </div>
                                            <div class="second-field">
                                                <div class="input-group bootstrap-timepicker ">
                                                    <input  name="palying_time[{{$cnt}}][to]" class="form-control input-group-addon timepicker-input" value="{{$time['to']}}">
                                                </div>
                                            </div>
                                            <div class="button-container">
                                                <div class="form-group">
                                                    <a class="text-success add-btn"><i class="fa fa-plus-square"></i></a>
                                                    <a class="text-danger remove-btn"><i class="fa fa-minus-square"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                @php $first= ''; $cnt++; } @endphp
                                @endif
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="panel panel-default">
                        <div class="panel-heading">Mail Setting</div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group {{ $errors->has('email_setting_host') ? ' has-error' :($errors->any()?'has-success':'')}}">
                                        <label class="control-label">Email Server</label>
                                        <input type="text" name="email_setting_host" value="{{old('email_setting_host',$model->email_setting_host)}}" class="form-control">
                                        @if ($errors->has('email_setting_host'))
                                        <span class="help-block">
                                            <strong>{{ $errors->first('email_setting_host') }}</strong>
                                        </span>
                                        @endif
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group {{ $errors->has('email_setting_driver') ? ' has-error' :($errors->any()?'has-success':'')}}">
                                        <label class="control-label">Mail Driver</label>
                                        <input type="text" name="email_setting_driver" value="{{old('email_setting_driver',$model->email_setting_driver)}}" class="form-control">
                                        @if ($errors->has('email_setting_driver'))
                                        <span class="help-block">
                                            <strong>{{ $errors->first('email_setting_driver') }}</strong>
                                        </span>
                                        @endif
                                    </div>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group {{ $errors->has('email_setting_encrypt') ? ' has-error' :($errors->any()?'has-success':'')}}">
                                        <label class="control-label">Email Encryption</label>
                                        <input type="text" name="email_setting_encrypt" value="{{old('email_setting_encrypt',$model->email_setting_encrypt)}}" class="form-control">
                                        @if ($errors->has('email_setting_encrypt'))
                                        <span class="help-block">
                                            <strong>{{ $errors->first('email_setting_encrypt') }}</strong>
                                        </span>
                                        @endif
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group {{ $errors->has('email_setting_port') ? ' has-error' :($errors->any()?'has-success':'')}}">
                                        <label class="control-label">Email Port</label>
                                        <input type="text" name="email_setting_port" value="{{old('email_setting_port',$model->email_setting_port)}}" class="form-control">
                                        @if ($errors->has('email_setting_port'))
                                        <span class="help-block">
                                            <strong>{{ $errors->first('email_setting_port') }}</strong>
                                        </span>
                                        @endif
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group {{ $errors->has('email_setting_username') ? ' has-error' :($errors->any()?'has-success':'')}}">
                                        <label class="control-label">Email Username</label>
                                        <input type="text" name="email_setting_username" value="{{old('email_setting_username',$model->email_setting_username)}}" class="form-control">
                                        @if ($errors->has('email_setting_username'))
                                        <span class="help-block">
                                            <strong>{{ $errors->first('email_setting_username') }}</strong>
                                        </span>
                                        @endif
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group {{ $errors->has('email_setting_password') ? ' has-error' :($errors->any()?'has-success':'')}}">
                                        <label class="control-label">Email Password</label>
                                        <input type="password" name="email_setting_password" value="{{old('email_setting_password',$model->email_setting_password)}}" class="form-control">
                                        @if ($errors->has('email_setting_password'))
                                        <span class="help-block">
                                            <strong>{{ $errors->first('email_setting_password') }}</strong>
                                        </span>
                                        @endif
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group {{ $errors->has('email_setting_mail_from_addr') ? ' has-error' :($errors->any()?'has-success':'')}}">
                                        <label class="control-label">Email From Address</label>
                                        <input type="text" name="email_setting_mail_from_addr" value="{{old('email_setting_mail_from_addr',$model->email_setting_mail_from_addr)}}" class="form-control">
                                        @if ($errors->has('email_setting_mail_from_addr'))
                                        <span class="help-block">
                                            <strong>{{ $errors->first('email_setting_mail_from_addr') }}</strong>
                                        </span>
                                        @endif
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group {{ $errors->has('email_setting_mail_from_name') ? ' has-error' :($errors->any()?'has-success':'')}}">
                                        <label class="control-label">Email From Name</label>
                                        <input type="text" name="email_setting_mail_from_name" value="{{old('email_setting_mail_from_name',$model->email_setting_mail_from_name)}}" class="form-control">
                                        @if ($errors->has('email_setting_mail_from_name'))
                                        <span class="help-block">
                                            <strong>{{ $errors->first('email_setting_mail_from_name') }}</strong>
                                        </span>
                                        @endif
                                    </div>
                                </div>
                            </div>
                        </div>
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
    $(document).ready(function(e){
        $("[data-mask]").inputmask();
        $('.timepicker-input').timepicker();
        $().addField({
                maximum_limit: 5,
                minimum_limit: 1,
                oldcount: {{$cnt}}
         });
    })
    
</script>
@endsection
