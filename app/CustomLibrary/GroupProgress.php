<?php
namespace App\CustomLibrary;
use App\Models\Group;
use App\Models\QuestionOption;
use App\Models\Questions;
use App\Models\MatrixTable;
use App\Models\MatrixTableAns;
use App\Models\Student;

class GroupProgress{
    public static function calculate(){
        $students  = Student::query()->select(['group_id'])->get();
        $group_ids = [];
        foreach($students as $student){
            $group_ids[] = $student->group_id;
        }
        $group_ids = array_unique($group_ids);
        $groups = Group::query()->whereIn('id',$group_ids)->get();
        foreach ($groups as $group){
            $groupProgress = \App\Models\GroupProgress::query()->where(['group_id'=>$group->id])->first();
            $groupProgress_res = $groupProgress;
            if($groupProgress_res == null){
               $groupProgress = new \App\Models\GroupProgress;
            }
            
            $groupProgress->group_name = $group->group_name;
            $groupProgress->group_id = $group->id;
            $members = [];
            $matrixTableAnswers = [];
            foreach ($group->student as $student){
                $matrixTableAnswer = MatrixTableAns::query()->where(['group_id'=>$groupProgress->group_id,'student_id'=>$student->id])->orderBy('id','DESC')->get()->toArray();
                $members[] = [
                    'student_id'=>$student->id,
                    'student_name'=>$student->name,
                    'answer_count'=>  count($matrixTableAnswer)/2
                ];
                $matrixTableAnswers = array_merge($matrixTableAnswers,$matrixTableAnswer);
            }
            $groupProgress->group_members = json_encode($members);
            
            $groupQuestion = \App\Models\GroupQuestion::query()->select(['id','question_id'])->where(['group_id'=>$group->id])->orderBy('id', 'DESC')->first();
            if($groupQuestion){
                $question = Questions::query()->select(['id','question'])->where(['id'=>$groupQuestion->question_id])->orderBy('id','DESC')->first();
                $groupProgress->question = $question->question;

                $matrixTable = MatrixTable::query()->where(['question_id'=>$question->id])->count();
                $questionOptPair = $matrixTable/2;


                $ansCount = 0;
                $timeCollection = [];

                foreach($matrixTableAnswers as $matrixTableA){
                    $timeCollection[] = $matrixTableA['time_taken'];
                    $ansCount++;
                }
                $answerPair = $ansCount/2;
                $groupProgress->total_matched = $answerPair;
                $groupProgress->matched_percentage = $answerPair*100/$questionOptPair;
                $groupProgress->matched_percentage  = round($groupProgress->matched_percentage ,2);
                $groupProgress->total_time_taken = self::totalTime($timeCollection);

                $groupProgress->save();
            }
            
        }
        return;
    }
    public static function totalTime($time_takens){
        
        $microSecPair = 0;
        $secondsPair = 0;
        $minutesPair = 0;
        $hoursPair = 0;
        
        foreach($time_takens as $time_taken){
            $time_takenArr = explode('.', $time_taken);
            
            $microSecPair += (float)$time_takenArr[1];
            
            if(isset($time_takenArr[0])){
                $mainTime = (int) $time_takenArr[0];
            }else{
                $mainTime = '0';
            }
            $mainTime_arr = explode(':', $mainTime);
            $mainTime_arr = array_reverse($mainTime_arr);
            
            if(isset($mainTime_arr[0])){
                $secondsPair += (int)$mainTime_arr[0];
            }
            if(isset($mainTime_arr[1])){
                $minutesPair += (int)$mainTime_arr[1];
            }
            if(isset($mainTime_arr[2])){
                $hoursPair += (int)$mainTime_arr[2];
            }
            
            
        }
        
        $microSec = $microSecPair/2;
        $sec = $secondsPair/2;
        $min = $minutesPair/2;
        $hour = $hoursPair/2;
        
        
        $sec += (int)($microSec/100);
        $microSec = $microSec%100;
        $min += (int)($sec/60);
        $sec = $sec%60;
        $hour += (int)($min/60);
        $min = $min%60;
        
        return "$hour:$min:$sec.$microSec";
        
    }
}

