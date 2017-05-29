<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class ExtraAnswer extends Model{
    
    
    protected $table = 'extra_answer';
    
    protected $filliable = [
        'question_id','student_id','answer_text','created_at', 'updated_at','common_question_id'
    ];
    
    public function getRules(){
        return [
                    'question_id'=>'required|integer',
                    'student_id'=>'required|integer',
                    'answer_text'=>'required|string',
                    'group_id'=>'required|integer',
        ];
    }
    public function student(){
        return $this->hasMany('App\Models\Student');
    }
    public function commonquestion(){
        return $this->hasOne('App\Models\CommonQuestions','id','common_question_id');
    }
}
