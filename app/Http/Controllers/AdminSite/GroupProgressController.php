<?php

namespace App\Http\Controllers\AdminSite;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\CustomLibrary\GroupProgress as GroupProgressLib;
use App\Models\MatrixTableAns;
use App\Models\Group;
use App\Models\Student;

class GroupProgressController extends Controller {

    public function index() {
        GroupProgressLib::calculate();
        $models = \App\Models\GroupProgress::query()->get();
        $pending_extra_anses = \App\Models\ExtraAnswer::query()->where(['correct_review'=>'0'])->get();
        return view('AdminSite.group-progress.index', [
            'models' => $models,
            'pending_extra_anses' => $pending_extra_anses,
        ]);
    }

    public function progressdetail(Request $request, $id) {
        $student = Student::query()->where(['id' => $id])->first();
        $group_questions = \App\Models\GroupQuestion::query()->where(['group_id' => $student->group_id])->first();

        $question = \App\Models\Questions::query()->where(['id' => $group_questions->question_id])->first();
        $groupModel = Group::query()->where(['id' => $student->group_id])->first();
        $members = Student::query()->select(['name'])->where(['group_id' => $student->group_id])->get();
        $matrixDatas = \App\Models\MatrixTable::query()->where(['question_id' => $question->id])->get();
        $totalTimeTakenByStudent = \App\Models\MatrixTableAns::totalTimeTakenByStudent($student->group_id,$student->id);

        $matrixDatasAns = \App\Models\MatrixTableAns::query()->where(['student_id' => $student->id, 'question_id' => $question->id])->get();

        $commonQuestionOrg = \App\Models\CommonQuestions::query()->where(['is_asked' => 1])->first();

        $commonAnswer = \App\Models\ExtraAnswer::query()->where(['group_id' => $student->group_id, 'question_id' => $question->id])->first();

        $commonQuestion = [];
        $commonQuestion = [
            'id' => $commonQuestionOrg->id,
            'question' => $commonQuestionOrg->question,
            'subpart' => $commonQuestionOrg->subpart,
        ];
        
        $extraAns = \App\Models\ExtraAnswer::query()->where(['student_id'=>$student->id])->first();

        return view('AdminSite.group-progress.detail', [
            'question' => $question,
            'matrixDatas' => $matrixDatas,
            'commonQuestion' => $commonQuestion,
            'matrixDatasAns' => $matrixDatasAns,
            'groupModel' => $groupModel,
            'members' => $members,
            'totalTimeTakenByStudent' => $totalTimeTakenByStudent,
            'submit_extra_ans' => ($commonAnswer == null) ? 0 : 1,
            'extraAns'=>$extraAns
        ]);
    }
    public function setextraanscorrect(Request $request){
        if($request->isMethod('post')){
           $postedData = $request->all();
           
           if(isset($postedData['correct_review'])){
              foreach($postedData['correct_review'] as $id => $value){
                $extraAnsModel = \App\Models\ExtraAnswer::query()->where(['id'=>$id])->first();
                $extraAnsModel->correct_review = $value;
                $extraAnsModel->save();
             } 
           }
           
           return redirect('admin/group-progress');
        }
    }

}
