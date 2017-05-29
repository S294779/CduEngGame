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
use App\Models\CommonQuestions;

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
        $groupQuestions = GroupQuestion::query()->select(['id', 'group_id'])->where(['question_id' => $id])->get()->toArray();

        return view('AdminSite.question.view', [
            'model' => $model,
            'options' => $options,
            'matrixDatas' => $matrixDatas,
            'groups' => $groups,
            'groupQuestions' => $groupQuestions,
            'commonQuestions' => CommonQuestions::getCommonQuestion()
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
            $model->common_question_id = $postedData['common_question_id'];
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
                $count = 1;
                $indexColl = [];
                foreach ($matrixDatas as $matrixData) {
                    if ($count % 2 == 0 && $matrixData['first_pair'] % 2 == 0 && $matrixData['second_pair'] % 2) {
                        $indexColl[] = $count;
                    }
                    $count++;
                }
                shuffle($indexColl);

                $commonQ = CommonQuestions::query()->select(['subpart'])->where(['id' => $model->common_question_id])->first();
                $subPart = json_decode($commonQ->subpart, true);


                $keyCollection = [];
                foreach ($this->partition($indexColl, count($subPart)) as $uniq) {
                    if (!empty($uniq)) {
                        $keyCollection[] = $uniq[0];
                    }
                }
                $cntr = 1;

                foreach ($matrixDatas as $matrixData) {
                    $matrix = new MatrixTable;
                    $matrix->first_pair = $matrixData['first_pair'];
                    $matrix->second_pair = $matrixData['second_pair'];
                    $matrix->label = $matrixData['label'];
                    $matrix->unique_key = $matrixData['unique_key'];
                    $matrix->question_id = $model->id;
                    $matrix->xposition = $matrixData['xposition'];
                    $matrix->yposition = $matrixData['yposition'];
                    if (in_array($cntr, $keyCollection) === true) {
                        $matrix->hint = 1;
                    } else {
                        $matrix->hint = 0;
                    }
                    $matrix->save();
                    $cntr++;
                }
            }
            if (isset($postedData['groups'])) {
                foreach ($postedData['groups'] as $group_id) {
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
            'groupQuestions' => $groupQuestions,
            'commonQuestions' => CommonQuestions::getCommonQuestion()
        ]);
    }

    public function update(Request $request, $id) {

        $model = Questions::query()->where(['id' => $id])->first();
        $options = QuestionOption::prepareOptionsForForm(QuestionOption::query()->where(['question_id' => $id])->orderBy('first_pair', 'ASC')->get()->toArray());

        $matrixDatas = MatrixTable::query()->where(['question_id' => $id])->orderBy('xposition', 'ASC')->get()->toArray();
        $groups = Student::getGroup();
        $groupQuestions = GroupQuestion::query()->select(['id', 'group_id'])->where(['question_id' => $id])->get()->toArray();
        $matrixAnsCount = \App\Models\MatrixTableAns::query()->where(['question_id'=>$id])->get()->count();
        
        if ($request->isMethod('post') && !$this->validate($request, $model->getRules())) {
            $postedData = $request->all();

            $model->question = $postedData['question'];
            $model->ans_matrix_size_x = $postedData['ans_matrix_size_x'];
            $model->ans_matrix_size_y = $postedData['ans_matrix_size_y'];
            $model->common_question_id = $postedData['common_question_id'];
            
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

                $count = 1;
                $indexColl = [];
                foreach ($matrixDatas as $matrixData) {
                    if ($count % 2 == 0 && $matrixData['first_pair'] % 2 == 0 && $matrixData['second_pair'] % 2) {
                        $indexColl[] = $count;
                    }
                    $count++;
                }
                shuffle($indexColl);

                $commonQ = CommonQuestions::query()->select(['subpart'])->where(['id' => $model->common_question_id])->first();
                $subPart = json_decode($commonQ->subpart, true);

                $keyCollection = [];
                foreach ($this->partition($indexColl, count($subPart)) as $uniq) {
                    if (!empty($uniq)) {
                        $keyCollection[] = $uniq[0];
                    }
                }
                
                $cntr = 1;
                foreach ($matrixDatas as $matrixData) {
                    $matrix = new MatrixTable;
                    $matrix->first_pair = $matrixData['first_pair'];
                    $matrix->second_pair = $matrixData['second_pair'];
                    $matrix->label = $matrixData['label'];
                    $matrix->unique_key = $matrixData['unique_key'];
                    $matrix->question_id = $model->id;
                    $matrix->xposition = $matrixData['xposition'];
                    $matrix->yposition = $matrixData['yposition'];
                    if (in_array($cntr, $keyCollection) === true) {
                        $matrix->hint = 1;
                    } else {
                        $matrix->hint = 0;
                    }
                    $matrix->save();
                    $cntr++;
                }
            }
            $gq_ids = [];
            foreach ($groupQuestions as $groupQuestion) {
                $gq_ids[] = $groupQuestion['id'];
            }
            GroupQuestion::destroy($gq_ids);
            if (isset($postedData['groups'])) {
                foreach ($postedData['groups'] as $group_id) {
                    $GroupQuestion = new GroupQuestion;
                    $GroupQuestion->question_id = $model->id;
                    $GroupQuestion->group_id = $group_id;
                    $GroupQuestion->save();
                }
            }
            if($matrixAnsCount>0){
                $matrixModels = \App\Models\MatrixTableAns::query()->where(['question_id'=>$id])->get();
                foreach($matrixModels as $matrixModel){
                    $matrixModel->delete();
                }
                
                //deleting extra answer
                $extraAnsModels = \App\Models\ExtraAnswer::query()->where(['question_id'=>$id])->get();
                foreach ($extraAnsModels as $extraAnsModel){
                    $extraAnsModel->delete();
                } 
            }
            //deleting extra answer
            $extraAnsModels = \App\Models\ExtraAnswer::query()->where(['question_id'=>$id])->get();
            foreach ($extraAnsModels as $extraAnsModel){
                $extraAnsModel->delete();
            }
            return redirect('/admin/question/view/' . $model->id);
        }
        return view('AdminSite.question.form', [
            'model' => $model,
            'options' => $options,
            'matrixDatas' => $matrixDatas,
            'groups' => $groups,
            'groupQuestions' => $groupQuestions,
            'commonQuestions' => CommonQuestions::getCommonQuestion(),
            'matrixAnsCount'=>$matrixAnsCount
        ]);
    }

    public function partition(Array $list, $p) {
        $listlen = count($list);
        $partlen = floor($listlen / $p);
        $partrem = $listlen % $p;
        $partition = array();
        $mark = 0;
        for ($px = 0; $px < $p; $px ++) {
            $incr = ($px < $partrem) ? $partlen + 1 : $partlen;
            $partition[$px] = array_slice($list, $mark, $incr);
            $mark += $incr;
        }
        return $partition;
    }

    public function delete(Request $request, $id) {
        if ($request->isMethod('post')) {
            //deleting question
            $model = Questions::query()->where(['id' => $id])->first();
            $model->delete();
            //deleting matrix table data
            $matrixQuestionIds = MatrixTable::query()->select(['id'])->where(['question_id' => $id])->get()->toArray();
            $mIds = [];
            foreach ($matrixQuestionIds as $matrixQuestionId) {
                $mIds[] = $matrixQuestionId['id'];
            }
            MatrixTable::destroy($mIds);
            //deleting options
            $optionQuestionIds = QuestionOption::query()->select(['id'])->where(['question_id' => $id])->get()->toArray();
            $oIds = [];
            foreach ($optionQuestionIds as $optionQuestionId) {
                $oIds[] = $optionQuestionId['id'];
            }
            QuestionOption::destroy($oIds);
            //deleting group question
            $groupQuestions = GroupQuestion::query()->select(['id'])->where(['question_id' => $id])->get()->toArray();
            $gQIds = [];
            foreach ($groupQuestions as $groupQuestion) {
                $gQIds[] = $groupQuestion['id'];
            }
            GroupQuestion::destroy($gQIds);
            
            //deleting matrix answer
            $matrixAnsModels = \App\Models\MatrixTableAns::query()->where(['question_id'=>$id])->get();
            if($matrixAnsModels){
               foreach ($matrixAnsModels as $matrixAnsModel){
                $matrixAnsModel->delete();
                }

                //deleting extra answer
                $extraAnsModels = \App\Models\ExtraAnswer::query()->where(['question_id'=>$id])->get();
                foreach ($extraAnsModels as $extraAnsModel){
                    $extraAnsModel->delete();
                } 
            }
            
            return redirect('/admin/question/index');
        }
    }

}
