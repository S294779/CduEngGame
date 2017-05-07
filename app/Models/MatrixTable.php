<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MatrixTable extends Model {

    protected $table = 'matrix_table';
    
    
    protected $filliable = [
        'first_pair','second_pair','unique_key','question_id','label','xposition','yposition'
    ];
    
    public static function manageMatrixFormData($optStr) {
        $options = explode('|', rtrim($optStr, '|'));
        
        $opt_new = [];
        foreach ($options as $option) {
            $op = explode('=>', $option);
            $pair = explode('][', $op[0]);
            $opt_new[] = [
                'first_pair'=>ltrim($pair[0],'['),
                'second_pair'=>rtrim($pair[1],']'),
                'label' => $op[1],
                'unique_key' => $op[2],
                'yposition' => $op[3],
                'xposition' => $op[4]
            ];
            
        }
        return $opt_new;
    }

}
