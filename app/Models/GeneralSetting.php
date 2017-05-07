<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class GeneralSetting extends Model{
    
    
    protected $table = 'general_setting';
    
    public $max_num_in_group;
    public $flip_game_window_size;
    public $email_sending_day;
    
    public $timestamps = false;

    protected $filliable = [
        'setting_value'
    ];
    
    public function getRules(){
        return [
                    'setting_value'=>'required|string|max:255'
        ];
    }
    public static function getValue($code){
        return self::query()->where(['setting_code'=>$code])->first();
    }
    public static function getDayNames(){
        return [
            'Monday'=>'Monday',
            'Tuesday'=>'Tuesday',
            'Wednesday'=>'Wednesday',
            'Thursday'=>'Thursday',
            'Friday'=>'Friday',
            'Saturday'=>'Saturday',
            'Sunday'=>'Sunday7',
        ];
    }
}
