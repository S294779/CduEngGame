<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class GeneralSetting extends Model {

    protected $table = 'general_setting';
    public $max_num_in_group;
    public $flip_game_window_size;
    public $email_sending_day;
    public $email_setting_host;
    public $email_setting_driver;
    public $email_setting_encrypt;
    public $email_setting_port;
    public $email_setting_username;
    public $email_setting_password;
    public $email_setting_mail_from_addr;
    public $email_setting_mail_from_name;
    public $playing_time;
    public $timestamps = false;

    const key = 'bcb04b7e103a0cd8b54763051cef08bc55abe029fdebae5e1d417e2ffb2a00a3';
    const METHOD = 'aes-256-ctr';

    protected $filliable = [
        'setting_value'
    ];

    public function getRules() {
        return [
            'setting_value' => 'required|string|max:255'
        ];
    }

    public static function getValue($code) {
        
        return self::query()->where(['setting_code' => $code])->first();
    }

    public static function getDayNames() {
        return [
            'Monday' => 'Monday',
            'Tuesday' => 'Tuesday',
            'Wednesday' => 'Wednesday',
            'Thursday' => 'Thursday',
            'Friday' => 'Friday',
            'Saturday' => 'Saturday',
            'Sunday' => 'Sunday7',
        ];
    }

    /**
     * Returns an encrypted & utf8-encoded
     */
    public static function encrypt($pure_string,$encode = true) {
        $nonceSize = openssl_cipher_iv_length(self::METHOD);
        $nonce = openssl_random_pseudo_bytes($nonceSize);

        $ciphertext = openssl_encrypt(
            $pure_string,
            self::METHOD,
            self::key,
            OPENSSL_RAW_DATA,
            $nonce
        );

        // Now let's pack the IV and the ciphertext together
        // Naively, we can just concatenate
        if ($encode) {
            return base64_encode($nonce.$ciphertext);
        }
        return $nonce.$ciphertext;
    }

    /**
     * Returns decrypted original string
     */
    public static function decrypt($encrypted_string,$encoded = true) {
        if ($encoded) {
            $encrypted_string = base64_decode($encrypted_string, true);
            if ($encrypted_string === false) {
                throw new Exception('Encryption failure');
            }
        }

        $nonceSize = openssl_cipher_iv_length(self::METHOD);
        $nonce = mb_substr($encrypted_string, 0, $nonceSize, '8bit');
        $ciphertext = mb_substr($encrypted_string, $nonceSize, null, '8bit');

        $plaintext = openssl_decrypt(
            $ciphertext,
            self::METHOD,
            self::key,
            OPENSSL_RAW_DATA,
            $nonce
        );

        return $plaintext;
    }
    public static function is_playing_time($time_required = null){
        
        $times = json_decode(self::getValue('GAME_PLAYING_TIME')->setting_value);
        if(Auth::user()->timezone != ''){
            date_default_timezone_set (Auth::user()->timezone);
        }
        
        if($time_required == null){
            
            $time_requiredDate = date('Y-m-d H:i:s');
            $time_required = strtotime($time_requiredDate);
        }
        $result = false;
        foreach ($times as $time){
            
            $fromDate = date('Y-m-d').' '.$time->from;
            $toDate = date('Y-m-d').' '.$time->to;
            
            $from = strtotime($fromDate);
            if($time->to == '00:00'){
                $to = strtotime($toDate.' +1 day');
            }else{
                $to = strtotime($toDate);
            }
            
            if($from <= $time_required && $time_required <= $to){
                $result = true;
               // break;
            }
        }
        return $result;
    }

}
