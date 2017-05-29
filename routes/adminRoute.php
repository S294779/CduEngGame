<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/


/*-------------------this can be accessed by without login---------------------*/


Route::group(['prefix' =>'admin','namespace' => 'AdminSite'], function () {
    
    Route::get('/login','LoginController@showLoginForm');
    Route::post('/login','LoginController@login');
    Route::get('/password/reset','LoginController@resetPassword');
    Route::get('/','HomeController@index');
    Route::get('/home','HomeController@index');
   
    Route::post('/logout','LoginController@logout');
    
    
    /*----------------group---------------------*/
    Route::get('/group/index','GroupController@index');
    
    Route::get('/group/create','GroupController@create');
    Route::post('/group/create','GroupController@create');
    Route::get('/group/update/{id}','GroupController@update');
    Route::post('/group/update/{id}','GroupController@update');
    
    Route::get('/group/view/{id}','GroupController@view');
    Route::post('/group/delete/{id}','GroupController@delete');
    
    /*----------------student---------------------*/
    Route::get('/student/index','StudentController@index');
    
    Route::get('/student/create','StudentController@create');
    Route::post('/student/create','StudentController@create');
    Route::get('/student/update/{id}','StudentController@update');
    Route::post('/student/update/{id}','StudentController@update');
    
    Route::get('/student/view/{id}','StudentController@view');
    Route::post('/student/delete/{id}','StudentController@delete');
    
    /*----------------question---------------------*/
    Route::get('/question/index','QuestionController@index');
    
    Route::get('/question/create','QuestionController@create');
    Route::post('/question/create','QuestionController@create');
    Route::get('/question/update/{id}','QuestionController@update');
    Route::post('/question/update/{id}','QuestionController@update');
    
    Route::get('/question/view/{id}','QuestionController@view');
    Route::post('/question/delete/{id}','QuestionController@delete');
    
    /*----------------setting---------------------*/
    Route::get('/setting/form','SettingController@form');
    Route::post('/setting/form','SettingController@form');
    
    /*----------------common-question---------------------*/
    Route::get('/common-question/index','CommonQuestionController@index');
    
    Route::get('/common-question/create','CommonQuestionController@create');
    Route::post('/common-question/create','CommonQuestionController@create');
    Route::get('/common-question/update/{id}','CommonQuestionController@update');
    Route::post('/common-question/update/{id}','CommonQuestionController@update');
    
    Route::get('/common-question/view/{id}','CommonQuestionController@view');
    Route::post('/common-question/delete/{id}','CommonQuestionController@delete');
    Route::get('/group-progress','GroupProgressController@index');
    
    Route::get('/progress-detail/{id}','GroupProgressController@progressdetail');
    Route::post('/extra-ans-correct','GroupProgressController@setextraanscorrect');
    
    

});
