@extends('AdminSite.layouts.main')
@section('breadcrumb')
<li><a class="btn btn-link" href="{{url('/admin')}}">Home</a></li>
<li><a class="btn btn-link" href="{{url('/admin/question/index')}}">All Questions</a></li>
@endsection
@section('content')
<link href="{!! asset('css/dragula.min.css') !!}" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="{!! asset('js/dragula.min.js') !!}"></script>
<style>
    #div1 {
        width: 350px;
        height: 70px;
        padding: 10px;
        border: 1px solid #aaaaaa;
    }
    #options>div{
        padding: 10px;
        cursor: move
    }
    #options>div:hover{
        background: #ccc;
    }
    #matrix-container{
        background: #a5ffc5;
        min-height: 50px
    }
    #options-container .fa-trash{
        color:#f00;
        cursor: pointer;

    }

    //css for matrix table

    #options-matrix td {
        position:relative;
        text-align:center;

    }
    #options-matrix .content{
        vertical-align: text-top;
        margin-bottom: 50%;
        margin-top: 50%;
        text-align:center;
    }
    #options-container tr .op-item{
        background: #f5bf74;
        color:#fff;
        cursor: pointer;
    }
    #options-container tr .active{
        background: #f0ad4e;
        color:#fff;
    }
    #options-matrix{
        color: #ccc;
        font-style: italic;
    }
    #options-matrix .col-filled{
        background: #00b3ee;
        font-style: normal;
        color: #000;
    }
    #options-matrix .pair-matched{
        background-color:#1ce2ab
    }
</style>
<form action="{{($model->id)?url('/admin/question/update',$model->id): url('/admin/question/create') }}" method="post">
    {{ csrf_field() }}
    <div class="row">
        <div class="col-sm-12">
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
        <div class="col-sm-10">
            <div class="form-group {{ $errors->has('groups') ? ' has-error' :($errors->any()?'has-success':'')}}">
                <label class="control-label">Group</label>
                <select name="groups[]" multiple="multiple"  class="form-control group-select2-seach">
                    @foreach($groups as $group)
                        @php
                            $gpSelected = '';
                        @endphp
                        @foreach($groupQuestions as $groupQuestion)
                            @php
                                if($group->id == $groupQuestion['group_id']){
                                    $gpSelected = 'selected';
                                }
                            @endphp
                        @endforeach
                        <option value="{{$group->id}}" {{$gpSelected}}>{{$group->group_name}}</option>
                    @endforeach
                </select>
            </div>
        </div>
        <div class="col-sm-1">
            <div class="form-group {{ $errors->has('ans_matrix_size_x') ? ' has-error' :($errors->any()?'has-success':'')}}">
                <label class="control-label">Size(X)</label>
                <input id="ans-matrix-size-x" type="number" name="ans_matrix_size_x" value="{{old('ans_matrix_size_x',$model->ans_matrix_size_x)}}" class="form-control" min="1">
                @if ($errors->has('ans_matrix_size_x'))
                <span class="help-block">
                    <strong>{{ $errors->first('ans_matrix_size_x') }}</strong>
                </span>
                @endif
            </div>
        </div>
        <div class="col-sm-1">
            <div class="form-group {{ $errors->has('ans_matrix_size_y') ? ' has-error' :($errors->any()?'has-success':'')}}">
                <label class="control-label">Size(Y)</label>
                <input id="ans-matrix-size-y"  type="number" name="ans_matrix_size_y" value="{{old('ans_matrix_size_y',$model->ans_matrix_size_y)}}" class="form-control" min="1">
                @if ($errors->has('ans_matrix_size_y'))
                <span class="help-block">
                    <strong>{{ $errors->first('ans_matrix_size_y') }}</strong>
                </span>
                @endif
            </div>
        </div>
    </div>
    <div class="form-group">
        <div class="row">
            <div class="col-sm-12">
                <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#question-option-modal">Add Option</button>
            </div>
        </div>
        <div  class="row" style="margin-top: 20px;">
            <div class="col-sm-12">
                <label class="option-container-title">Options</label>
                <table id="options-container" class="table table-bordered">
                    @foreach($options as $option)
                    <tr>
                        @foreach($option as $pair)
                        <td class="op-item"><div class="content" data-key="[<?=$pair['first_pair']?>][<?=$pair['second_pair']?>]"><?=$pair['question_option']?></div></td>
                        @endforeach
                        <td style="width:50px"><a class="fa fa-2x fa-trash option-remove-btn"></a></td>
                    </tr>
                    @endforeach
                </table>
            </div>
            <div class="col-sm-12">
                <div class="form-group {{ $errors->has('options') ? ' has-error' :($errors->any()?'has-success':'')}}">
                <input type="hidden" name="options" value="{{old('options',$model->options)}}" id="question-options">
                @if ($errors->has('options'))
                <span class="help-block">
                    <strong>{{ $errors->first('options') }}</strong>
                </span>
                @endif
                </div>
            </div>
        </div>
    </div>
    <div class="form-group" style="overflow-x: scroll">
        <table id="options-matrix" class="table table-bordered" style="table-layout: fixed;margin-bottom: 0px">
            @php
                for($i = 1; $i<=$model->ans_matrix_size_y;$i++){
            @endphp
            <tr>
                @for($j = 1; $j<=$model->ans_matrix_size_x;$j++)
                @php
                    $content = '<div class="content">Empty</div>';
                    $matrixClass = '';
                    foreach($matrixDatas as $matrixData){
                        if($matrixData['xposition'] == $j && $matrixData['yposition'] == $i){
                            $content = '<div class="content" data-key="['.$matrixData['first_pair'].']['.$matrixData['second_pair'].']" data-pair="'.$matrixData['unique_key'].'" data-yposition="'.$matrixData['yposition'].'" data-xposition="'.$matrixData['xposition'].'" >'.$matrixData['label'].'</div>';
                            $matrixClass = 'col-filled';
                        }
                    }
                @endphp
                <td class="{{$matrixClass}}">{!!$content!!}</td>
                @endfor
            </tr>
            @php
                }
            @endphp
        </table>
        <div class="col-sm-12">
                <input type="hidden" name="matrix_data" id="question-matrix-field">
        </div>
    </div>
    <div class="form-group">
        <button type="submit" id="question-submit-btn" class="btn {{($model->id)?'btn-primary':'btn-success'}}">{{($model->id)?'Update':'Create'}}</button>
    </div>
</form>
<div id="question-option-modal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Modal Header</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-sm-6">
                        <input id="first-option-pair" class="form-control" type="text" name="option[1][1]">
                    </div>
                    <div class="col-sm-6">
                        <input id="second-option-pair" class="form-control" type="text" name="option[1][2]">
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button id="add-option-btn" type="button" class="btn btn-success pull-left" >Add</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="{!! asset('js/question.js') !!}"></script>
@endsection

