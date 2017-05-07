<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MatrixTableAns extends Model {

    protected $table = 'matrix_table_ans';

    protected $filliable = [
        'first_pair','second_pair','unique_key','question_id','label','xposition','yposition','group_id','time_taken'
    ];

}
