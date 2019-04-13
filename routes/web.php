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
    Route::get('units/create_unit/{root_id}/{unit_type}/{mode}', ['uses' => '\App\Http\Controllers\Voyager\UnitController@create_unit']);
    Route::get('units/unit_contents/{unit_id}', ['uses' => '\App\Http\Controllers\Voyager\UnitController@get_unit_contents']);
    Route::post('units/reorder/{unit_id}', ['uses' => '\App\Http\Controllers\Voyager\UnitController@reorder_unit_contents']);

    /* TESTS */
    Route::get('tests/create_question/{test_id}', ['uses' => '\App\Http\Controllers\Voyager\TestController@create_question']);
    Route::get('tests/create_answer/{question_id}', ['uses' => '\App\Http\Controllers\Voyager\TestController@create_answer']);

    Route::post('tests/edit_question/{question_id}', ['uses' => '\App\Http\Controllers\Voyager\TestController@edit_question']);
    Route::post('tests/edit_answer/{answer_id}', ['uses' => '\App\Http\Controllers\Voyager\TestController@edit_answer']);
    /* ========= */
    Route::get('tests/get_test_items/{test_id}', ['uses' => '\App\Http\Controllers\Voyager\TestController@get_test_items']);
    Route::post('tests/reorder/{test_id}', ['uses' => '\App\Http\Controllers\Voyager\TestController@reorder_test_items']);
    
});

Route::get('/', 'LandingController@index');

Route::get('/vklanding', 'IntoWebController@index');
Route::get('/jslp', 'LandingController@index');

Route::post('/transaction', 'ApiController@transactionSave');
Route::prefix('cabinet')->group(function () {
	Route::get('/', 'CabinetController@index')->name("cabinet");
});


Route::get('/purchase/{unit_id}', 'PurchaseController@index');
Route::get('/promo/{promo_id}/{vk_user_id}', 'PromoController@index');


Route::get('pass_unit/{program_id}/{unit_id}', 'LearningController@passUnit');
Route::get('{program_slug}/{lesson_slug}', 'LearningController@showLesson');
Route::get('{program_slug}', 'LearningController@showLesson');






