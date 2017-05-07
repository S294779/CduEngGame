@extends('AdminSite.layouts.main')
@section('breadcrumb')
<li><a class="btn btn-link" href="{{url('/admin')}}">Home</a></li>
<li><a class="btn btn-link" href="{{url('/admin/question/index')}}">All Questions</a></li>
@endsection
@section('content')
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
<div class="detail-page">
    <p>
        <a class="btn btn-primary" href="{{url('admin/question/update',$model->id)}}">Update</a>
        <a class="btn btn-danger" data-method='post' href="{{url('admin/question/delete',$model->id)}}">Delete</a>
    </p>
    <table class="table table-bordered" id="group-datail-table">
        <tr>
            <td style="width: 200px">Question</td><td>{{$model->question}}</td>
        </tr>
        <tr>
            <td style="width: 200px">Question Option</td>
            <td>
                <table id="options-container" class="table table-bordered">
                    @foreach($options as $option)
                    <tr>
                        @foreach($option as $pair)
                        <td class="op-item"><div class="content" data-key="[<?=$pair['first_pair']?>][<?=$pair['second_pair']?>]"><?=$pair['question_option']?></div></td>
                        @endforeach
                    </tr>
                    @endforeach
                </table>
            </td>
        </tr>
        <tr>
            <td style="width: 200px">Involing Group</td>
            <td>
                <table class="table table-bordered" style="margin-bottom: 0px">
                    <tr>
                        <th>#</th>
                        <th>Group Name</th>
                        <th>Group Description</th>
                    </tr>
                    @php
                        $cnt = 1;
                    @endphp
                    @foreach($groupQuestions as $groupQuestion)
                    <tr>
                        @foreach($groups as $group)
                        @if($group->id == $groupQuestion['group_id'])
                            <td>{{$cnt}}</td>
                            <td>{{$group->group_name}}</td>
                            <td>{{$group->group_description}}</td>
                        @endif
                        @endforeach
                       
                    </tr>
                    @php
                        $cnt++;
                    @endphp
                    @endforeach
                </table>
            </td>
        </tr>
        <tr>
            <td style="width: 200px">Matrix Option</td>
            <td>
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
                    $content = '<div class="content" data-key="['.$i.']['.$j.']" data-pair="'.$matrixData['unique_key'].'" data-yposition="'.$matrixData['yposition'].'" data-xposition="'.$matrixData['xposition'].'" >'.$matrixData['label'].'</div>';
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
            </td>
        </tr>
</table>
</div>
<script type="text/javascript" src="{!! asset('js/questionDetail.js') !!}"></script>
@endsection
