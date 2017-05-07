<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class ExtraAnswer extends Model{
    
    
    protected $table = 'extra_answer';
    
    protected $filliable = [
        'question_id','student_id','answer_text','created_at', 'updated_at'
    ];
    
    public function getRules(){
        return [
                    'question_id'=>'required|integer',
                    'student_id'=>'required|integer',
                    'answer_text'=>'required|string'
        ];
    }
    public function student(){
        return $this->hasMany('App\Models\Student');
    }
}
