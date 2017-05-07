<?php
namespace App\Http\Controllers\AdminSite;

use App\Http\Controllers\Controller;
use \Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Auth;

class LoginController extends Controller
{
            use AuthenticatesUsers;

            protected $redirectTo = '/admin';
            
            protected $guard = 'admin';

            public function __construct(){
                
                $this->middleware('admin', ['except' => 'logout']);
            }

            public function resetPassword()
            {
                  return view('AdminSite.auth.passwords.email');
            }
            public function logout(Request $request)
            {
                $this->guard('admin')->logout();

                $request->session('admin')->flush();

                $request->session('admin')->regenerate();

                return redirect('/admin/login');
            }
            public function showLoginForm()
            {
                return view('AdminSite.auth.login');
            }
            protected function guard()
            {
                return Auth::guard('admin');
            }
            
}