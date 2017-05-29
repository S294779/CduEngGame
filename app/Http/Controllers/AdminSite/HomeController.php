<?php
namespace App\Http\Controllers\AdminSite;
use App\Http\Controllers\Controller;
use Auth;
use App\Models\Group;
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
        
        
        $groups = Group::query()->get();
        $students = \App\Models\Student::query()->get();
        $questions = \App\Models\Questions::query()->get();
        return view('AdminSite.index',[
            'groups'=>$groups,
            'students'=>$students,
            'questions'=>$questions,
        ]);
        
    }
}

