@extends('AdminSite.layouts.main')
@section('breadcrumb')
<li><a class="btn btn-link" href="{{url('/admin')}}">Home</a></li>
<li><a class="btn btn-link" href="{{url('/admin/group-progress')}}">Group Progress</a></li>
@endsection
@section('content')
<style>

    #answer-matrix td {
        position:relative;
        text-align:center;
        color: #00b3ee
    }
    #answer-matrix .content{
        vertical-align: text-top;
        margin-bottom: 50%;
        margin-top: 50%;
        text-align:center;
    }
    #answer-matrix .col-matched{
        background: #fff;
        color: #000;
    }
    #answer-matrix .pair-matched{
        background-color:#1ce2ab
    }

    .noselect {
        -webkit-touch-callout: none; /* iOS Safari */
        -webkit-user-select: none; /* Safari */
        -khtml-user-select: none; /* Konqueror HTML */
        -moz-user-select: none; /* Firefox */
        -ms-user-select: none; /* Internet Explorer/Edge */
        user-select: none; /* Non-prefixed version, currently
                              supported by Chrome and Opera */
    }
    #answer-matrix td{
        cursor: pointer;
    }
    
</style>
<div class="row">
        <div class="col-sm-12">
            <p><b>Question: {{$question->question}}</b></p>
        </div>
        <div class="col-sm-12">
                @if($extraAns)
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Extra Question (Asked)</th>
                            <th>Extra Question (submitted)</th>
                            <th>Extra Answer (submitted)</th>
                            <th>Result</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>{{$question->commonquestion->question}}</td>
                            <td>{{$extraAns->question_text}}</td>
                            <td>{{$extraAns->answer_text}}</td>
                            <td>{{($extraAns->correct_review == 1)?'Correct':'Not Correct'}}</td>
                        </tr>
                    </tbody>
                </table>
                @else
                <p>Extra Answer: <span class="not-set">No Answer</span></p>
                @endif
                
        </div>
        <div class="col-sm-12" style="overflow-x: scroll;">
            
            <div class="col-sm-12" style="padding: 15px; background-color: #00b3ee">
                <table id="answer-matrix" class="table table-bordered" style="table-layout: fixed;margin-bottom: 0px;">
                    @php
                    $matched = 0;
                    for($i = 1; $i<=$question->ans_matrix_size_y;$i++){
                    @endphp
                    <tr>
                        @for($j = 1; $j<=$question->ans_matrix_size_x;$j++)
                        @php
                        $content = '<div class="content">Empty</div>';
                    $matrixClass = '';

                    foreach($matrixDatas as $matrixData){
                            if($matrixData['xposition'] == $j && $matrixData['yposition'] == $i){
                                    $matrixClass = 'not-col-matched';
                                    $dataPair = '';
                                    foreach($matrixDatasAns as $matrixDatasAn){
                                        if($matrixData->xposition == $matrixDatasAn->xposition && $matrixData->yposition == $matrixDatasAn->yposition && $matrixData->label == $matrixDatasAn->label ){
                                            $matrixClass = 'col-matched';
                                            $dataPair = $matrixDatasAn->unique_key;
                                            $matched++;
                                            break;
                                        }

                                    }
                                    $content = '<div class="content" data-q="'.$question->id.'" data-key="['.$matrixData['first_pair'].']['.$matrixData['second_pair'].']" data-pair="'.$dataPair.'" >'.$matrixData['label'].'</div>';
                            }
                    }
                    @endphp
                    <td class="{{$matrixClass}}" >{!!$content!!}</td>
                    @endfor
                    </tr>
                    @php
                    }
                    @endphp
                </table>
            </div>
        </div>
    </div>
<script type="text/javascript" src="{!! asset('js/answerDetail.js') !!}"></script>
@endsection