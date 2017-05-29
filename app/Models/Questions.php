<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class Questions extends Model{
    
    
    public $options;
    public $matrix_data;
    public $groups;


    protected $table = 'questions';
    
    protected $filliable = [
        'question','created_at', 'updated_at','ans_matrix_size_x','ans_matrix_size_y','common_question_id'
    ];
    
    public function getRules(){
        return [
                    'question'=>'required|string|max:255',
                    'options'=>'required',
                    'common_question_id'=>'required',
                    'ans_matrix_size_x'=>'required',
                    'ans_matrix_size_y'=>'required',
                    
        ];
    }
    public function options()
    {
        return $this->belongsTo('QuestionOption','id');
    }
    public function commonquestion()
    {
        return $this->hasOne('App\Models\CommonQuestions','id','common_question_id');
    }
}
