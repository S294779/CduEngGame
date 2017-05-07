<?php

namespace App\Http\Controllers\AdminSite;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\CommonQuestions;
use Illuminate\Support\Facades\Redirect;
use Auth;
use App\Models\GeneralSetting;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class CommonQuestionController extends Controller {

    public function index() {

        $models = CommonQuestions::query()->paginate(3);
        
        return view('AdminSite.common-question.index', [
            'models' => $models
        ]);
    }

    public function view($id) {

        $model = CommonQuestions::query()->where(['id' => $id])->first();
       
        return view('AdminSite.common-question.view', [
            'model' => $model
        ]);
    }

    public function create(Request $request) {
        $model = new CommonQuestions;
        if ($request->isMethod('post') && !$this->validate($request, $model->getRules())) {
            $postedData = $request->all();
            $model->question = $postedData['question'];
            if($postedData['is_asked']){
                $model->is_asked = 1;
            }else{
                $model->is_asked = 0;
            }
            $model->save();
            
            return redirect('/admin/common-question/view/' . $model->id);
        }

        return view('AdminSite.common-question.form', [
            'model' => $model
        ]);
    }

    public function update(Request $request, $id) {

        $model = CommonQuestions::query()->where(['id' => $id])->first();
        if ($request->isMethod('post') && !$this->validate($request, $model->getRules())) {
            $postedData = $request->all();
            $model->question = $postedData['question'];
            if(isset($postedData['is_asked'])){
                $model->is_asked = 1;
            }else{
                $model->is_asked = 0;
            }
            $model->save();
            
            return redirect('/admin/common-question/view/' . $model->id);
        }
        return view('AdminSite.common-question.form', [
            'model' => $model
        ]);
    }

    public function delete(Request $request, $id) {
        if ($request->isMethod('post')) {
            
            CommonQuestions::destroy($id);
            
            return redirect('/admin/common-question/index');
        }
    }

}
