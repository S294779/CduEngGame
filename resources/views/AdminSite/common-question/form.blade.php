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
        margin-right: 10px;
        float: left;
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
<script type="text/javascript" src="{!! asset('js/dynamicFormCommonQ.js') !!}"></script>
<form id="common-question-form" action="{{($model->id)?url('/admin/common-question/update',$model->id): url('/admin/common-question/create') }}" method="post">
    {{ csrf_field() }}
    <div class="row">
        <div class="col-sm-10">
            <div class="form-group {{ $errors->has('question') ? ' has-error' :($errors->any()?'has-success':'')}}">
                <label class="control-label">Question</label>
                <input id="question-field" type="text" name="question" value="{{old('question',$model->question)}}" class="form-control ">
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
    <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label">Question Subpart</label>
                                </div>
                            </div>
                            <div class="row" id="dyna-field-container">
                                @php
                                    $cnt = 1;
                                @endphp
                                @if(empty($model->subpart))
                                <div class="first dyna-fields">
                                    <div class="col-md-12">
                                        <div class="first-field">
                                            <div class="form-group">
                                                <input  name="subpart[0]" class="form-control subpart-field">
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
                                @php $cnt = 0; $first = 'first'; foreach($model->subpart as $subpart){ @endphp
                                    <div class="{{$first}} dyna-fields">
                                        <div class="col-md-12">
                                            <div class="first-field">
                                                <div class="form-group">
                                                    <input  name="subpart[{{$cnt}}]" class="form-control subpart-field" value="{{$subpart}}">
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

    <div class="form-group">
        <button type="submit" id="question-submit-btn" class="btn {{($model->id)?'btn-primary':'btn-success'}}">{{($model->id)?'Update':'Create'}}</button>
    </div>
</form>

<script>
    $(document).ready(function(e){
        
        $().addField({
                maximum_limit: 3,
                minimum_limit: 1,
                oldcount: {{$cnt}}
         });
        $('#common-question-form').submit(function(e){
            var error = 0;
            $('#common-question-form input').each(function(){
                
                if($(this).val()){
                    $(this).removeErrorMessage();
                    
                }else{
                    error++;
                    $(this).setErrorMessage({
                        message:'field is required'
                    });
                    
                }
            });
            if(error != 0 ){
                return false;
            }
        }); 
    })
    
</script>
@if(!$model->id)
<script>
    $(document).ready(function(e){
        
        for(var i =2; i<=3; i++){
            $('.dyna-fields .add-btn').click();
        }
        
    })
    
</script>
@endif
@endsection

