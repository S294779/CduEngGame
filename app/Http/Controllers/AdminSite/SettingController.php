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
        $model->email_sending_day = $model->getValue('EMAIL_SENDING_DAY')->setting_value;
        $model->email_sending_day = [];
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
            
            return redirect('admin/setting/form');
        }
        return view('AdminSite.setting.settingForm',[
            'model'=>$model
        ]);
    }
}
