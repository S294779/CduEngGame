<?php

namespace App\CustomLibrary;

use Mail;
use Config;
use App\Models\GeneralSetting;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class MailSend {

    public static function config() {
        Config::set('mail.username',GeneralSetting::getValue('MAIL_SETTING_USERNAME')->setting_value);
        Config::set('mail.password',GeneralSetting::decrypt(GeneralSetting::getValue('MAIL_SETTING_PASSWORD')->setting_value));
        
        Config::set('mail.host', GeneralSetting::getValue('MAIL_SETTING_HOST')->setting_value);
        Config::set('mail.driver', GeneralSetting::getValue('MAIL_SETTING_DRIVER')->setting_value);
        Config::set('mail.encryption',GeneralSetting::getValue('MAIL_SETTING_ENCRYPT')->setting_value);
        Config::set('mail.port', GeneralSetting::getValue('MAIL_SETTING_PORT')->setting_value);
        Config::set('mail.from.address', GeneralSetting::getValue('MAIL_SETTING_MAIL_FROM_ADDR')->setting_value);
        Config::set('mail.from.name', GeneralSetting::getValue('MAIL_SETTING_MAIL_FROM_NAME')->setting_value);
      
        return;
    }

    public function process() {
        self::config();
        
        $user = \App\Models\Student::query()->first();
        return Mail::send('emails.groupResult', ['user' => $user], function ($cofig) use ($user) {
            $cofig->from('sbr.mgr1@gmail.com', 'CDU');
            $cofig->to('sbr.mgr1@gmail.com', $user->name)->subject('Your Reminder!');
        });
    }
    public function sendresetmail($email,$token) {
        self::config();
        return Mail::send('emails.passwordReset', ['token' => $token], function ($cofig) use ($email) {
            $cofig->from('sbr.mgr1@gmail.com', 'CDU');
            $cofig->to($email, $email)->subject('Your Reminder!');
        });
    }

}
