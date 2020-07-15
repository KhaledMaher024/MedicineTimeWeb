<?php

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::group(['namespace' => 'Api', 'prefix' => 'v1', 'middleware' => ['auth:api', 'cors', 'json.response']], function () {

    /**
     * after auth routes
     */
    Route::get('/patient', 'PatientsController@getPatientInfo');
    Route::post('/patient/update', 'PatientsController@updatePatientInfo');
    Route::get('/patient/doctor', 'PatientsController@getDoctorInfo');
    Route::get('/patient/clinic', 'PatientsController@getClinicInfo');
    Route::get('/patient/reviews', 'PatientVisitsController@getReviewTime');

    //*here*//
    Route::get('/patient/drugs', 'PatientController@getDrugsList');
    Route::get('/patient/drugsTime', 'PatientController@getDrugsHistory');

});

Route::group(['namespace' => 'Api', 'prefix' => 'v1', 'middleware' => ['cors', 'json.response']], function () {

    /**
     * before auth routes
     */
    Route::post('/patient/register', 'AuthController@postRegister');
    Route::post('/patient/login', 'AuthController@postLogin');
    Route::get('/patient/logout', 'AuthController@getLogout');

});
