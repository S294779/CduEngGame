<?php

namespace App\Http\Controllers\AdminSite;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Questions;
use Illuminate\Support\Facades\Redirect;
use Auth;
use App\Models\GeneralSetting;
use App\Models\QuestionOption;
use App\Models\MatrixTable;
use App\Models\Student;
use App\Models\GroupQuestion;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class QuestionController extends Controller {

    public function index() {

        $models = Questions::query()->paginate(3);

        return view('AdminSite.question.index', [
            'models' => $models
        ]);
    }

    public function view($id) {

        $model = Questions::query()->where(['id' => $id])->first();
        $options = QuestionOption::prepareOptionsForForm(QuestionOption::query()->where(['question_id' => $id])->orderBy('first_pair', 'ASC')->get()->toArray());
        $matrixDatas = MatrixTable::query()->where(['question_id' => $id])->orderBy('xposition', 'ASC')->get()->toArray();
        $groups = Student::getGroup();
        $groupQuestions = GroupQuestion::query()->select(['id','group_id'])->where(['question_id' => $id])->get()->toArray();
        
        return view('AdminSite.question.view', [
            'model' => $model,
            'options' => $options,
            'matrixDatas' => $matrixDatas,
            'groups'=>$groups,
            'groupQuestions'=>$groupQuestions,
        ]);
    }

    public function create(Request $request) {
        $default_matrix_size = GeneralSetting::getValue('FLIP_GAME_WINDOW_SIZE');

        $model = new Questions;
        $ans_matrix_size = explode('X', $default_matrix_size->setting_value);

        $model->ans_matrix_size_x = $ans_matrix_size[0];
        $model->ans_matrix_size_y = $ans_matrix_size[1];

        $groups = Student::getGroup();
        $groupQuestions = [];
                

        if ($request->isMethod('post') && !$this->validate($request, $model->getRules())) {
            $postedData = $request->all();
            
            $model->question = $postedData['question'];
            $model->ans_matrix_size_x = $postedData['ans_matrix_size_x'];
            $model->ans_matrix_size_y = $postedData['ans_matrix_size_y'];
            $options = QuestionOption::manageOptionFormData($postedData['options']);
            $model->save();
            foreach ($options as $option) {
                $oprionModel = new QuestionOption;
                $oprionModel->first_pair = $option['first_pair'];
                $oprionModel->second_pair = $option['second_pair'];
                $oprionModel->question_option = $option['question_option'];
                $oprionModel->question_id = $model->id;
                $oprionModel->save();
            }
            if ($postedData['matrix_data'] != '') {
                $matrixDatas = MatrixTable::manageMatrixFormData($postedData['matrix_data']);
                foreach ($matrixDatas as $matrixData) {
                    $matrix = new MatrixTable;
                    $matrix->first_pair = $matrixData['first_pair'];
                    $matrix->second_pair = $matrixData['second_pair'];
                    $matrix->label = $matrixData['label'];
                    $matrix->unique_key = $matrixData['unique_key'];
                    $matrix->question_id = $model->id;
                    $matrix->xposition = $matrixData['xposition'];
                    $matrix->yposition = $matrixData['yposition'];
                    $matrix->save();
                }
            }
            if(isset($postedData['groups'])){
                foreach ($postedData['groups'] as $group_id){
                    $GroupQuestion = new GroupQuestion;
                    $GroupQuestion->question_id = $model->id;
                    $GroupQuestion->group_id = $group_id;
                    $GroupQuestion->save();
                }
            }

            return redirect('/admin/question/view/' . $model->id);
        }

        return view('AdminSite.question.form', [
            'model' => $model,
            'options' => [],
            'matrixDatas' => [],
            'groups' => $groups,
            'groupQuestions'=>$groupQuestions
        ]);
    }

    public function update(Request $request, $id) {

        $model = Questions::query()->where(['id' => $id])->first();
        $options = QuestionOption::prepareOptionsForForm(QuestionOption::query()->where(['question_id' => $id])->orderBy('first_pair', 'ASC')->get()->toArray());
        
        $matrixDatas = MatrixTable::query()->where(['question_id' => $id])->orderBy('xposition', 'ASC')->get()->toArray();
        $groups = Student::getGroup();
        $groupQuestions = GroupQuestion::query()->select(['id','group_id'])->where(['question_id' => $id])->get()->toArray();

        if ($request->isMethod('post') && !$this->validate($request, $model->getRules())) {
            $postedData = $request->all();

            $model->question = $postedData['question'];
            $model->ans_matrix_size_x = $postedData['ans_matrix_size_x'];
            $model->ans_matrix_size_y = $postedData['ans_matrix_size_y'];
            $options = QuestionOption::manageOptionFormData($postedData['options']);
            $model->save();

            $matrixQuestionIds = MatrixTable::query()->select(['id'])->where(['question_id' => $id])->get()->toArray();
            $mIds = [];
            foreach ($matrixQuestionIds as $matrixQuestionId) {
                $mIds[] = $matrixQuestionId['id'];
            }
            MatrixTable::destroy($mIds);

            $optionQuestionIds = QuestionOption::query()->select(['id'])->where(['question_id' => $id])->get()->toArray();
            $oIds = [];
            foreach ($optionQuestionIds as $optionQuestionId) {
                $oIds[] = $optionQuestionId['id'];
            }
            QuestionOption::destroy($oIds);

            foreach ($options as $option) {
                $oprionModel = new QuestionOption;
                $oprionModel->first_pair = $option['first_pair'];
                $oprionModel->second_pair = $option['second_pair'];
                $oprionModel->question_option = $option['question_option'];
                $oprionModel->question_id = $model->id;
                $oprionModel->save();
            }
            if ($postedData['matrix_data'] != '') {
                $matrixDatas = MatrixTable::manageMatrixFormData($postedData['matrix_data']);
                foreach ($matrixDatas as $matrixData) {
                    $matrix = new MatrixTable;
                    $matrix->first_pair = $matrixData['first_pair'];
                    $matrix->second_pair = $matrixData['second_pair'];
                    $matrix->label = $matrixData['label'];
                    $matrix->unique_key = $matrixData['unique_key'];
                    $matrix->question_id = $model->id;
                    $matrix->xposition = $matrixData['xposition'];
                    $matrix->yposition = $matrixData['yposition'];
                    $matrix->save();
                }
            }
            $gq_ids = [];
            foreach ($groupQuestions as $groupQuestion) {
                $gq_ids[] = $groupQuestion['id'];
            }
            GroupQuestion::destroy($gq_ids);
            if(isset($postedData['groups'])){
                foreach ($postedData['groups'] as $group_id){
                    $GroupQuestion = new GroupQuestion;
                    $GroupQuestion->question_id = $model->id;
                    $GroupQuestion->group_id = $group_id;
                    $GroupQuestion->save();
                }
            }
            return redirect('/admin/question/view/' . $model->id);
        }
        return view('AdminSite.question.form', [
            'model' => $model,
            'options' => $options,
            'matrixDatas' => $matrixDatas,
            'groups'=>$groups,
            'groupQuestions'=>$groupQuestions
        ]);
    }

    public function delete(Request $request, $id) {
        if ($request->isMethod('post')) {
            $model = Questions::query()->where(['id' => $id])->first();
            $model->delete();

            $matrixQuestionIds = MatrixTable::query()->select(['id'])->where(['question_id' => $id])->get()->toArray();
            $mIds = [];
            foreach ($matrixQuestionIds as $matrixQuestionId) {
                $mIds[] = $matrixQuestionId['id'];
            }
            MatrixTable::destroy($mIds);

            $optionQuestionIds = QuestionOption::query()->select(['id'])->where(['question_id' => $id])->get()->toArray();
            $oIds = [];
            foreach ($optionQuestionIds as $optionQuestionId) {
                $oIds[] = $optionQuestionId['id'];
            }
            QuestionOption::destroy($oIds);
            
            $groupQuestions = GroupQuestion::query()->select(['id'])->where(['question_id' => $id])->get()->toArray();
            $gQIds = [];
            foreach ($groupQuestions as $groupQuestion) {
                $gQIds[] = $groupQuestion['id'];
            }
            GroupQuestion::destroy($gQIds);

            return redirect('/admin/question/index');
        }
    }

}
