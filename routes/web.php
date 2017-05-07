<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Route::group(['namespace' => 'FrontSite'], function () {

    Route::Auth();
    Route::get('/', function () {
        return view('welcome');
    });

    

});
Route::group(['middleware' =>['web','auth'],'namespace' => 'FrontSite'], function () {

    Route::get('/home','HomeController@index');
    Route::post('/home','HomeController@index');
    
    Route::post('/extra-question-ans-save','HomeController@extraQuestionSave');
    
    Route::post('/set-extra-ans','HomeController@extraAnsSave');
    
    Route::post('/matrix-table-ans','HomeController@matrixTableAns');
    
    Route::post('/load-chat-message','HomeController@loadChatMessage');
    
    Route::post('/post-chat-message','HomeController@postChatMessage');
    
    Route::post('/set-seen-msg','HomeController@setSeenMsg');

    Route::get('/home2',function(){
        echo 'this is home2';
    });

});

