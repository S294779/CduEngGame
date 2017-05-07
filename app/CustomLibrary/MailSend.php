<?php
namespace App\CustomLibrary;
use Mail;
use Config;
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
class MailSend{
    
    public function process(){
        return 'cgfvbhjmk,l';
        $user = \App\Models\Student::query()->first();
        $cofig = Config::get('mail');
        echo '<pre>';
        print_r($cofig);
        die;
        
        Mail::send('emails.groupResult', ['user' => $user], function ($cofig) use ($user) {
            $cofig->from('sbr.mgr1@gmail.com', 'CDU');

            $cofig->to('sbr.mgr1@gmail.com', $user->name)->subject('Your Reminder!');
        });
    }
}
