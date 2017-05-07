<?php
namespace App\Http\Controllers\AdminSite;
use App\Http\Controllers\Controller;
use Auth;
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
class HomeController extends Controller{
    
    public function __construct(){
        
        $this->middleware('admin');
    }
    public function index(){
        
        if(!Auth::guard('admin')->check()){
            
            return redirect('admin/login');
        }
        return view('AdminSite.index');
        
    }
}

