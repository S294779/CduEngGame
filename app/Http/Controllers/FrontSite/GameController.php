<?php
namespace App\Http\Controllers\FrontSite;

use App\Http\Controllers\Controller;
use Auth;
use App\Models\Group;
use Illuminate\Http\Request;
use App\Models\Student;

class GameController extends Controller{
    
    public function index(Request $request){
        
        return view('FrontSite.game.index');
        
    }
}

