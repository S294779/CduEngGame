<?php

namespace App\Http\Controllers\FrontSite;

use App\Http\Controllers\Controller;
use Auth;
use App\Models\Group;
use Illuminate\Http\Request;
use App\Models\Student;

class HomeController extends Controller {

    public function index(Request $request) {

        if ($request->isMethod('post')) {
            $postedData = $request->all();
            $model = Student::query()->where(['id' => Auth::user()->id])->first();
            $model->group_id = $postedData['group'];
            $model->save();
            return redirect('/home');
        }
        if (Auth::user()->group_id > 0) {
            $group_questions = \App\Models\GroupQuestion::query()->where(['group_id' => auth()->user()->group_id])->first();
            $question = \App\Models\Questions::query()->where(['id' => $group_questions->question_id])->first();
            $groupModel = Group::query()->where(['id' => auth()->user()->group_id])->first();
            $members = Student::query()->select(['name'])->where(['group_id' => auth()->user()->group_id])->get();
            $matrixDatas = \App\Models\MatrixTable::query()->where(['question_id' => $question->id])->get();
            $matrixDatasAns = \App\Models\MatrixTableAns::query()->where(['group_id' => auth()->user()->group_id, 'question_id' => $question->id])->get();

            $commonQuestions = \App\Models\CommonQuestions::query()->where(['is_asked' => 1])->get();
            $extraQuestions = [];
            foreach ($commonQuestions as $commonQuestion) {
                $extraQuestions[] = [
                    'id' => $commonQuestion->id,
                    'question' => $commonQuestion->question
                ];
            }
            return view('FrontSite.index', [
                'question' => $question,
                'matrixDatas' => $matrixDatas,
                'extraQuestions' => $extraQuestions,
                'matrixDatasAns' => $matrixDatasAns,
                'groupModel' => $groupModel,
                'members' => $members
            ]);
        } else {
            $groupModels = Group::query()->get();
            return view('FrontSite.default', [
                'groupModels' => $groupModels
            ]);
        }
    }

    public function extraAnsSave(Request $request) {

        $ExtraAnswer = new \App\Models\ExtraAnswer;
        $ExtraAnswer->question_id = $request->all()['question_id'];
        $ExtraAnswer->student_id = Auth::user()->id;
        $ExtraAnswer->answer_text = $request->all()['answer'];
        $ExtraAnswer->save();
    }

    public function matrixTableAns(Request $request) {
        if ($request->isMethod('post')) {
            $postedata = $request->all();
            $datas = $postedata['data'];
            foreach ($datas as $data) {
                $MatrixTableAns = new \App\Models\MatrixTableAns();
                $pairData = explode('][', $data['key']);
                $first_pair = ltrim($pairData[0], '[');
                $second_pair = rtrim($pairData[1], ']');
                $MatrixTableAns->first_pair = $first_pair;
                $MatrixTableAns->second_pair = $second_pair;
                $MatrixTableAns->question_id = $data['q'];
                $MatrixTableAns->xposition = $data['xposition'];
                $MatrixTableAns->yposition = $data['yposition'];
                $MatrixTableAns->label = $data['label'];
                $MatrixTableAns->unique_key = $data['uniqueKey'];
                $MatrixTableAns->group_id = Auth::user()->group_id;
                $MatrixTableAns->student_id = Auth::user()->id;
                $MatrixTableAns->time_taken = $data['time_taken'];
                $MatrixTableAns->save();
            }
        }
    }

    public function loadChatMessage(Request $request) {
        $models = \App\Models\ChatMessages::query()->where(['group_id' => Auth::user()->group_id])->orderBy('arrived_time', 'ASC')->get();
        $models_new = [];

        foreach ($models as $model) {
            if ($model->from_id == Auth::user()->id) {
                $messagetype = 'sent-message';
                $nameAlign = 'float:right';
            } else {
                $messagetype = 'receipt-message';
                $nameAlign = 'float:left';
            }
            if ($model->seen_time == null) {
                $seen_status = 'unseen';
            } else {
                $seen_status = 'seen';
            }


            $student = $model->student->name;
            $models_new[] = [
                'message' => $model->message,
                'messagetype' => $messagetype,
                'student' => $student,
                'nameAlign' => $nameAlign,
                'seen_status' => $seen_status,
                'gmsgu_id' => $model->id
            ];
            $seen_status = '';
        }
        return $models_new;
    }

    public function postChatMessage(Request $request) {
        $postedData = $request->all();

        $chatMessage = new \App\Models\ChatMessages();
        $chatMessage->message = $postedData['message'];
        $chatMessage->from_id = Auth::user()->id;
        $chatMessage->group_id = Auth::user()->group_id;
        $chatMessage->arrived_time = date('Y-m-d H:i:s');
        $chatMessage->deleted = 0;
        $chatMessage->save();
    }

    public function setSeenMsg(Request $request) {
        $postedData = $request->all();
        if (isset($postedData['data'])) {
            $ids = [];
            foreach ($postedData['data'] as $data) {
                $ids[] = $data['gmsg'];
            }
            $ids = array_unique($ids);
            $models = \App\Models\ChatMessages::query()->whereIn('id', $ids)->get();
            foreach ($models as $model) {
                $model->seen_time = date('Y-m-d H:i:s');
                $model->save();
            }
        }
    }

}
