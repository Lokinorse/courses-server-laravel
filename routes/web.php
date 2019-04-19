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
Auth::routes();


Route::get('auth/{provider}', 'Auth\LoginController@redirectToProvider')->name("oauth");
Route::get('callback/{provider}', 'ApiCallbackController@handleProviderCallback');

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();


    /* UNITS */

    Route::get('programs/create_course/{program_id}', ['uses' => '\App\Http\Controllers\Voyager\ProgramController@create_course']);
    Route::get('programs/program_contents/{program_id}', ['uses' => '\App\Http\Controllers\Voyager\ProgramController@get_program_contents']);
    Route::post('programs/reorder/{program_id}', ['uses' => '\App\Http\Controllers\Voyager\ProgramController@reorder_courses']);




    Route::get('courses/create_lesson/{course_id}/{lesson_type}', ['uses' => '\App\Http\Controllers\Voyager\CourseController@create_lesson']);
    Route::get('courses/course_contents/{course_id}', ['uses' => '\App\Http\Controllers\Voyager\CourseController@get_course_contents']);
    Route::post('courses/reorder/{course_id}', ['uses' => '\App\Http\Controllers\Voyager\CourseController@reorder_lessons']);





    /* TESTS */
    Route::get('lessons/create_question/{lesson_id}', ['uses' => '\App\Http\Controllers\Voyager\LessonController@create_question']);
    Route::get('lessons/create_answer/{question_id}', ['uses' => '\App\Http\Controllers\Voyager\LessonController@create_answer']);

    Route::post('lessons/edit_question/{question_id}', ['uses' => '\App\Http\Controllers\Voyager\LessonController@edit_question']);
    Route::post('lessons/edit_answer/{answer_id}', ['uses' => '\App\Http\Controllers\Voyager\LessonController@edit_answer']);
    /* ========= */
    Route::get('lessons/get_test_items/{lesson_id}', ['uses' => '\App\Http\Controllers\Voyager\LessonController@get_test_items']);
    Route::post('lessons/reorderTest/{lesson_id}', ['uses' => '\App\Http\Controllers\Voyager\LessonController@reorder_test_items']);
    
});

Route::get('/', 'LandingController@index');

Route::get('/vklanding', 'IntoWebController@index');
Route::get('/jslp', 'LandingController@index');

//Route::post('/transaction', 'ApiController@transactionSave');
Route::prefix('cabinet')->group(function () {
	Route::get('/', 'CabinetController@index')->name("cabinet");
});


Route::get('/messages/{destination_type}/{target_id}/{message_type}', 'ChatController@index');
Route::get('/sendMessage/{destination_type}/{target_id}/{message_type}/{parent_id}', 'ChatController@sendMessage');
Route::get('/sendMessage/{destination_type}/{target_id}/{message_type}', 'ChatController@sendMessage');


Route::get('/purchase/{unit_id}', 'PurchaseController@index');
Route::get('/promo/{promo_id}/{vk_user_id}', 'PromoController@index');


Route::get('/processTest/{program_id}/{lesson_id}', 'LearningController@processTest');
Route::get('/pass_lesson/{program_id}/{lesson_id}', 'LearningController@unlockNextLesson');

Route::get('{program_slug}/{course_slug}/{lesson_slug}', 'LearningController@showLesson');
Route::get('{program_slug}/{course_slug}', 'LearningController@showLesson');
Route::get('{program_slug}', 'LearningController@showLesson');








