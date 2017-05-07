<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class QuestionOption extends Model {

    protected $table = 'question_options';
    
    protected $filliable = [
        'first_pair','second_pair','question_option','question_id'
    ];
    
    public function getRules() {
        return [
            'question' => 'required|string|max:255'
        ];
    }

    public static function manageOptionFormData($optStr) {
        $options = explode('|', rtrim($optStr, '|'));
        $opt_new = [];
        foreach ($options as $option) {
            $op = explode('=>', $option);
            $pair = explode('][', $op[0]);
            $opt_new[] = [
                'first_pair'=>ltrim($pair[0],'['),
                'second_pair'=>rtrim($pair[1],']'),
                'question_option' => $op[1]
            ];
            
        }
        return $opt_new;
    }
    public static function prepareOptionsForForm($options){
        return array_chunk($options, 2);
    }

}
