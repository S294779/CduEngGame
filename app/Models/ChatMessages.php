<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ChatMessages extends Model {

    protected $table = 'chat_messages';
    public $timestamps = false;
    protected $filliable = [
        'message', 'from_id','group_id', 'arrived_time', 'seen_time', 'deleted'
    ];

    public function getRules() {
        return [
            'message' => 'required|string',
            'from_id' => 'required|integer',
            'group_id' => 'required|integer',
            'arrived_time' => 'required',
            'seen_time' => 'required',
            'deleted' => 'required|integer',
        ];
    }

    public function student() {
        return $this->hasOne('App\Models\Student','id','from_id');
    }

}
