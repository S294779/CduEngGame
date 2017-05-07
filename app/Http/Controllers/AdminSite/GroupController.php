<?php
namespace App\Http\Controllers\AdminSite;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Group;
use Illuminate\Support\Facades\Redirect;
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
class GroupController extends Controller{
    
    
    
    public function __construct(){
        
        $this->middleware('admin');
    }
    public function index(){
        
        $models = Group::query()->paginate(3);
        
        return view('AdminSite.group.index',[
            'models'=>$models
        ]);
        
    }
    public function view($id){
        
        $model = Group::query()->where(['id'=>$id])->first();
        
        return view('AdminSite.group.view',[
            'model'=>$model
        ]);
        
    }
    public function create(Request $request){
        $model = new Group;
        if($request->isMethod('post') && !$this->validate($request, $model->getRules())){
            $postedData = $request->all();
            $model->group_name = $postedData['group_name'];
            $model->group_description = $postedData['group_description'];
            $model->save();
            return redirect('/admin/group/view/'.$model->id);
        }
        return view('AdminSite.group.form',[
            'model'=>$model
        ]);
        
    }
    public function update(Request $request,$id){
        
        $model = Group::query()->where(['id'=>$id])->first();
        
        if($request->isMethod('post') && !$this->validate($request, $model->getRules())){
            $postedData = $request->all();
            $model->group_name = $postedData['group_name'];
            $model->group_description = $postedData['group_description'];
            $model->save();
            return redirect('/admin/group/view/'.$model->id);
        }
        return view('AdminSite.group.form',[
            'model'=>$model
        ]);
        
    }
    public function delete(Request $request,$id){
        if($request->isMethod('post')){
            $model = Group::query()->where(['id'=>$id])->first();
            $model->delete();
            return redirect('/admin/group/index');
        }
    }
}
