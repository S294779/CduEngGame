<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class PasswordResets extends Model{
    
    
    protected $table = 'password_resets';
    
    public $timestamps = false;
    
    protected $filliable = [
        'email','token','created_at'
    ];
    
    public function getRules(){
        return [
                    'password'=>'required',
                    'password_confirmation'=>'required|same:password',
        ];
    }
    
}
