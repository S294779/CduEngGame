<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class Group extends Model{
    
    
    protected $table = 'group';
    
    protected $filliable = [
        'group_name','group_description','created_at', 'updated_at'
    ];
    
    public function getRules(){
        return [
                    'group_name'=>'required|string|max:255',
                    'group_description'=>'string'
        ];
    }
    public function student(){
        return $this->hasMany('App\Models\Student');
    }
}
