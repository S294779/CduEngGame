<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CommonQuestions extends Model {

    protected $table = 'common_question';
    protected $filliable = [
        'question', 'created_at', 'updated_at'
    ];

    public function getRules() {
        return [
            'question' => 'required|string|max:255',
        ];
    }

    public static function getCommonQuestion() {
        
        return self::query()->where(['is_asked'=>1])->get();
        
    }

}
