<?php
namespace App\Http\Controllers\AdminSite;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Auth;
use App\Models\GeneralSetting;
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
class SettingController extends Controller{
    
    public function __construct(){
        
        $this->middleware('admin');
    }
    public function form(Request $request){
        $model = new GeneralSetting;
        
        $model->max_num_in_group = $model->getValue('MAX_MEMBER_IN_GROUP')->setting_value;
        $model->flip_game_window_size = $model->getValue('FLIP_GAME_WINDOW_SIZE')->setting_value;
        $model->email_sending_day = json_decode($model->getValue('EMAIL_SENDING_DAY')->setting_value);
        $model->email_setting_host = $model->getValue('MAIL_SETTING_HOST')->setting_value;
        $model->email_setting_driver = $model->getValue('MAIL_SETTING_DRIVER')->setting_value;
        $model->email_setting_encrypt = $model->getValue('MAIL_SETTING_ENCRYPT')->setting_value;
        $model->email_setting_port = $model->getValue('MAIL_SETTING_PORT')->setting_value;
        $model->email_setting_username = $model->getValue('MAIL_SETTING_USERNAME')->setting_value;
        $model->email_setting_password = GeneralSetting::decrypt($model->getValue('MAIL_SETTING_PASSWORD')->setting_value);
        $model->email_setting_mail_from_addr = $model->getValue('MAIL_SETTING_MAIL_FROM_ADDR')->setting_value;
        $model->email_setting_mail_from_name = $model->getValue('MAIL_SETTING_MAIL_FROM_NAME')->setting_value;
        $times = [];
        foreach(json_decode($model->getValue('GAME_PLAYING_TIME')->setting_value) as $time){
            $times[] = [
                'from'=>date('g:i A',strtotime($time->from)),
                'to'=>date('g:i A',strtotime($time->to))
            ];
        }
        
        $model->playing_time = (object)$times;
        
        if($request->isMethod('post')){
            $postedData = $request->all();
            
            $model1 = GeneralSetting::getValue('MAX_MEMBER_IN_GROUP');
            $model1->setting_value = $postedData['max_num_in_group']; 
            $model1->save();
            $model2 = GeneralSetting::getValue('FLIP_GAME_WINDOW_SIZE');
            $model2->setting_value = $postedData['flip_game_window_size']; 
            $model2->save();
            
            $model3 = GeneralSetting::getValue('EMAIL_SENDING_DAY');
            $model3->setting_value = json_encode($postedData['email_sending_day']); 
            $model3->save();
            
            $model4 = GeneralSetting::getValue('MAIL_SETTING_HOST');
            $model4->setting_value = $postedData['email_setting_host']; 
            $model4->save();
            
            $model5 = GeneralSetting::getValue('MAIL_SETTING_DRIVER');
            $model5->setting_value = $postedData['email_setting_driver']; 
            $model5->save();
            
            $model6 = GeneralSetting::getValue('MAIL_SETTING_ENCRYPT');
            $model6->setting_value = $postedData['email_setting_encrypt']; 
            $model6->save();
            
            $model7 = GeneralSetting::getValue('MAIL_SETTING_PORT');
            $model7->setting_value = $postedData['email_setting_port']; 
            $model7->save();
            
            $model8 = GeneralSetting::getValue('MAIL_SETTING_USERNAME');
            $model8->setting_value = $postedData['email_setting_username']; 
            $model8->save();
            
            $model9 = GeneralSetting::getValue('MAIL_SETTING_PASSWORD');
            $model9->setting_value = GeneralSetting::encrypt($postedData['email_setting_password']); 
            $model9->save();
            
            $model10 = GeneralSetting::getValue('MAIL_SETTING_MAIL_FROM_ADDR');
            $model10->setting_value = $postedData['email_setting_mail_from_addr']; 
            $model10->save();
            
            $model11 = GeneralSetting::getValue('MAIL_SETTING_MAIL_FROM_NAME');
            $model11->setting_value = $postedData['email_setting_mail_from_name']; 
            $model11->save();
            
            $model12 = GeneralSetting::getValue('GAME_PLAYING_TIME');
            
            $times = [];
            foreach($postedData['palying_time'] as $time){
                $times[] = [
                    'from'=>date('H:i',strtotime($time['from'])),
                    'to'=>date('H:i',strtotime($time['to']))
                ];
            }
            $model12->setting_value = json_encode($times);
            $model12->save();
            
            return redirect('admin/setting/form');
        }
        return view('AdminSite.setting.settingForm',[
            'model'=>$model
        ]);
    }
}
