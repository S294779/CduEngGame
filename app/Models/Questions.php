<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class Questions extends Model{
    
    
    public $options;
    public $matrix_data;
    public $groups;


    protected $table = 'questions';
    
    protected $filliable = [
        'question','created_at', 'updated_at','ans_matrix_size_x','ans_matrix_size_y'
    ];
    
    public function getRules(){
        return [
                    'question'=>'required|string|max:255',
                    'options'=>'required',
                    
        ];
    }
    public function options()
    {
        return $this->belongsTo('QuestionOption','id');
    }
}
