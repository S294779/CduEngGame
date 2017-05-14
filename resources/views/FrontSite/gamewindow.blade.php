<script type="text/javascript" src="{!! asset('js/answer.js') !!}"></script>
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
    $content = '<div class="content" data-q="'.$question->id.'" data-key="['.$matrixData['first_pair'].']['.$matrixData['second_pair'].']" data-yposition="'.$matrixData['yposition'].'" data-xposition="'.$matrixData['xposition'].'" data-label="'.$matrixData['label'].'" >'.$matrixData['label'].'</div>';
    $matrixClass = 'not-col-matched';
    foreach($matrixDatasAns as $matrixDatasAn){
    if($matrixData->xposition == $matrixDatasAn->xposition && $matrixData->yposition == $matrixDatasAn->yposition && $matrixData->label == $matrixDatasAn->label ){
    $matrixClass = 'col-matched';
    $matched++;
    break;
    }

    }
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
@php
$matched = $matched/2;
@endphp
<script>
    $(document).ready(function () {
        
    });
            
</script>