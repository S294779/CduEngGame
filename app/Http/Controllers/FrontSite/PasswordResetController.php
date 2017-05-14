<?php
namespace App\Http\Controllers\FrontSite;

use App\Http\Controllers\Controller;
use Auth;
use App\Models\PasswordResets;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use App\CustomLibrary\MailSend;
use App\Models\Student;

class PasswordResetController extends Controller{
    public function index(Request $request){
        $postedData = $request->all();
        $student = Student::query()->where(['email'=>$postedData['email']])->first();
        if($student){
            $passwordReset = new PasswordResets;
            $passwordReset->email = $postedData['email'];
            $passwordReset->token = bcrypt(time());
            $passwordReset->created_at = date('Y-m-d H:i:s');
            $passwordReset->expired_at = date('Y-m-d H:i:s',strtotime('+20 minutes'));
            $passwordReset->save();
            
            $mailSend = new MailSend;
            $mailSend->sendresetmail($passwordReset->email,$passwordReset->token);
            Session::flash('success', 'Email has been successfully sent.');
            return redirect('/password/reset');
        }else{
            Session::flash('danger', 'This email is not in our list.');
            return redirect('/password/reset');
        }
        
    }
    public function resetExternal(Request $request){
        $token = $request->query('token');
        $tokenModel = PasswordResets::query()->where(['token'=>$token])->where('expired_at','>=',date('Y-m-d H:i:s'))->first();
        if($tokenModel){
            if ($request->isMethod('post') && !$this->validate($request, $tokenModel->getRules())) {
                $postedData = $request->all();
                $student = Student::query()->where(['email'=>$tokenModel->email])->first();
                if($student){
                    $student->password = bcrypt($postedData['password']);
                    $student->save();
                    Session::flash('success', 'Your password has been successfully changed.');
                    return redirect('/');
                }
                
            }else{
                return view('FrontSite.password-reset.resetForm',[
                    'tokenModel'=>$tokenModel
                ]);
            }
            
        }else{
            return view('FrontSite.password-reset.tokenExpired',[
                    'tokenModel'=>$tokenModel
                ]);
        }
    }
}
