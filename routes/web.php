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
Auth::routes(['verify' => true]);


Route::get('auth/{provider}', 'Auth\LoginController@redirectToProvider')->name("oauth");
Route::get('callback/{provider}', 'ApiCallbackController@handleProviderCallback');
Route::post('yandex/mcallback', 'ApiCallbackController@yandexMoneyProviderCallback');






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



    Route::prefix('fakier')->group(function () {

        Route::get('form', ['uses' => '\App\Http\Controllers\FakierController@form'])->name("fakier_form");
        Route::post('save_and_run', ['uses' => '\App\Http\Controllers\FakierController@save_and_run'])->name("fakier_save");
        Route::get('get_messages/{page}', ['uses' => '\App\Http\Controllers\FakierController@get_messages'])->name("fakier_parse");
        Route::get('get_question_data/{question_id}', ['uses' => '\App\Http\Controllers\FakierController@get_question_data'])->name("fakier_get_question_data");
        
    
        Route::post('save_parse_users', ['uses' => '\App\Http\Controllers\FakierController@save_parse_users'])->name("fakier_save_parse_users");
        Route::get('parse_users', ['uses' => '\App\Http\Controllers\FakierController@parse_users'])->name("fakier_parse_users");
        Route::get('change_users', ['uses' => '\App\Http\Controllers\FakierController@change_users'])->name("fakier_change_users");
        Route::get('make_dummies', ['uses' => '\App\Http\Controllers\FakierController@make_dummies'])->name("fakier_make_dummies");
    
        Route::post('offset_date', ['uses' => '\App\Http\Controllers\FakierController@offset'])->name("fakier_change_offset");

        Route::get('some_test_process', ['uses' => '\App\Http\Controllers\FakierController@some_test_process']);

    });
    
});

Route::get('/', 'LandingController@index');

Route::get('/vklanding', 'IntoWebController@index');
Route::get('/jslp', 'LandingController@index');

//Route::post('/transaction', 'ApiController@transactionSave');
Route::prefix('cabinet')->group(function () {
    Route::get('/', 'CabinetController@index')->name("cabinet");

    Route::prefix('profile')->group(function () {
        Route::get('/', 'CabinetController@settings')->name("cabinet_profile");
        Route::get('/settings', 'CabinetController@settings')->name("cabinet_settings");
        Route::get('/transactions', 'CabinetController@transactions')->name("cabinet_transactions");
        Route::get('/pay', 'CabinetController@pay')->name("cabinet_pay");
    });
    //Route::get('/profile', 'CabinetController@profile')->middleware('verified')->name("cabinet_profile");




    Route::post('/profile_save', 'CabinetController@profile_save')->middleware('verified')->name("cabinet_profile_save");
    Route::post('/profile_password_change', 'CabinetController@profile_password_change')->middleware('verified')->name("cabinet_profile_password_change");
    Route::post('/cabinet_change_avatar', 'CabinetController@cabinet_change_avatar')->middleware('verified')->name("cabinet_change_avatar");
    
});

Route::prefix('community')->group(function () {
	Route::get('/', 'CommunityController@index')->name("community");
    Route::get('/question/new', 'CommunityController@new_question')->name("community_new_question");
    
	Route::get('/question/{question_slug}', 'CommunityController@question')->name("community_question");
	Route::get('/flood/', 'CommunityController@flood')->name("community_flood");
	Route::get('/reviews/', 'CommunityController@reviews')->name("community_reviews");
    Route::get('/questions/', 'CommunityController@questions')->name("community_questions");

    
    Route::prefix('tech')->group(function () {
        Route::post('/upload_image/{owner_type}', 'CommunityController@upload_image')->name("community_upload");
        Route::post('/save_message/{message_id}', 'CommunityController@save_message')->name("community_save_message");
        
        Route::post('/change_message_destination/{message_id}', 'CommunityController@change_message_destination')->name("community_change_message_destination");

        Route::post('/approve_message/{message_id}', 'CommunityController@approve_message')->name("community_approve_message");
        Route::post('/delete_message/{message_id}', 'CommunityController@delete_message')->name("community_delete_message");
        Route::post('/report_message/{message_id}', 'CommunityController@report_message')->name("community_report_message");

        
        Route::post('/skin_user/{user_id}', 'CommunityController@skin_user')->name("community_skin_user");
    });
});



Route::get('/jsonsearch/{entity_name}', 'JsonController@search');


Route::get('/messages/{destination_type}/{target_id}/{message_type}', 'ChatController@index');
Route::get('/sendMessage/{destination_type}/{target_id}/{message_type}/{parent_id}', 'ChatController@sendMessage');
Route::get('/sendMessage/{destination_type}/{target_id}/{message_type}', 'ChatController@sendMessage');


Route::get('/purchase/{target_type}/{target_id}', 'PurchaseController@index');
Route::get('/promo/{promo_id}/{vk_user_id}', 'PromoController@index');


Route::get('/processTest/{program_id}/{lesson_id}', 'LearningController@processTest');
Route::get('/pass_lesson/{program_id}/{lesson_id}', 'LearningController@unlockNextLesson');

Route::get('{program_slug}/{course_slug}/{lesson_slug}', 'LearningController@showLesson');
Route::get('{program_slug}/{course_slug}', 'LearningController@showLesson');
Route::get('{program_slug}', 'LearningController@showLesson');








