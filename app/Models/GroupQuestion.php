<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class GroupQuestion extends Model{
    
    
    protected $table = 'group_question';
    
    protected $filliable = [
        'group_id','question_id','created_at', 'updated_at'
    ];
    
    public function getRules(){
        return [
                    'group_id'=>'required|integer',
                    'question_id'=>'required|integer'
        ];
    }
}
