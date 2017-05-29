<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Auth;

class MatrixTableAns extends Model {

    protected $table = 'matrix_table_ans';

    protected $filliable = [
        'first_pair','second_pair','unique_key','question_id','label','xposition','yposition','group_id','time_taken'
    ];
    public static function totalTimeTakenByStudent($group_id,$student_id){
        $matrixTableAnswers = MatrixTableAns::query()->select(['time_taken'])->where(['group_id'=>$group_id,'student_id'=>$student_id])->orderBy('id','DESC')->get()->toArray();
        $time_takens = [];
        $total_time = 0;
        foreach($matrixTableAnswers as $matrixTableAnswer){
            $time_takens[] = $matrixTableAnswer['time_taken'];
        }
        return \App\CustomLibrary\GroupProgress::totalTime($time_takens);
        
    }

}
