<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Student extends Model{
    
    
    protected $table = 'users';
    
    protected $filliable = [
        'name','email','password','remember_token','created_at', 'updated_at','group_id'
    ];
    
    public function getRules(){
        return [
                    'name'=>'required|string|max:255',
                    'email'=>'required|email|unique:users|max:255',
                    'password'=>'required',
                    'group_id'=>'required|integer',
        ];
    }
    public function getRulesUpdate(){
        return [
                    'name'=>'required|string|max:255',
                    'email'=>'required|email|max:255',
                    'password'=>'required',
                    'group_id'=>'required|integer',
        ];
    }
    public static function getGroup(){
        $studentModels = self::query()
                ->select([DB::raw('count(*) as total'),'group_id'])
                ->groupBy('group_id')
                ->get()->toArray();
        $max_member = GeneralSetting::getValue('MAX_MEMBER_IN_GROUP')->setting_value;
        $tightGroupIds = [];
        foreach ($studentModels as $studentModel){
            if($studentModel['total'] >= $max_member){
                $tightGroupIds[] = $studentModel['group_id'];
            }
        }
        return Group::query()->whereNotIn('id',$tightGroupIds)->get();
        
    }
    
    
}
