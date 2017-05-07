<?php
namespace App\Http\Controllers\AdminSite;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Student;
use Illuminate\Support\Facades\Redirect;
use Auth;
use App\Models\Group;
use App\Models\GeneralSetting;

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
class StudentController extends Controller{
    
    public function __construct(){
        
        $this->middleware('admin');
    }
    public function index(){
        
        $models = Student::query()->paginate(3);
        
        return view('AdminSite.student.index',[
            'models'=>$models
        ]);
        
    }
    public function view($id){
        
        $model = Student::query()->where(['id'=>$id])->first();
        $groupModel = Group::query()->where(['id'=>$model->group_id])->first();
        
        return view('AdminSite.student.view',[
            'model'=>$model,
            'groupModel'=>$groupModel,
        ]);
        
    }
    public function create(Request $request){
        
        $model = new Student;
        if($request->isMethod('post') && !$this->validate($request, $model->getRules())){
            $postedData = $request->all();
            $model->name = $postedData['name'];
            $model->email = $postedData['email'];
            $model->password = bcrypt($postedData['password']);
            $model->group_id = $postedData['group_id'];
            $model->save();
            return redirect('/admin/student/view/'.$model->id);
        }
        return view('AdminSite.student.form',[
            'model'=>$model,
            'groupModels'=>Student::getGroup()
        ]);
        
    }
    public function update(Request $request,$id){
        
        $model = Student::query()->where(['id'=>$id])->first();
        
        if($request->isMethod('post') && !$this->validate($request, $model->getRulesUpdate())){
            $postedData = $request->all();
            $model->name = $postedData['name'];
            $model->email = $postedData['email'];
            $model->group_id = $postedData['group_id'];
            $model->save();
            return redirect('/admin/student/view/'.$model->id);
        }
        $groupModels = Group::query()->get();
        return view('AdminSite.student.form',[
            'model'=>$model,
            'groupModels'=>$groupModels
        ]);
        
    }
    public function delete(Request $request,$id){
        if($request->isMethod('post')){
            $model = Student::query()->where(['id'=>$id])->first();
            $model->delete();
            return redirect('/admin/student/index');
        }
    }
}
