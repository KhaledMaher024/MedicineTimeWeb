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
    Route::get('/patient/info', 'PatientsController@getPatientInfo');
    Route::get('/patient/doctors', 'DoctorsController@getDoctors');
    Route::get('/patient/doctors/{doctor_id}', 'DoctorsController@getDoctorInfo');
    Route::get('/patient/drug/doses', 'PatientsController@getDrugsDose');

    Route::post('/patient/update/password', 'PatientsController@updatePatientPassword');
    Route::post('/patient/update/info', 'PatientsController@updatePatientInfo');
    Route::get('/patient/logout', 'PatientsController@getLogout');

    //*here*//
    Route::get('/patient/drugs', 'PatientController@getDrugsList');
    Route::get('/patient/drugsTime', 'PatientController@getDrugsHistory');

    Route::post('/password/email', 'Api\ForgotPasswordController@sendResetLinkEmail');
    Route::post('/password/reset', 'Api\ResetPasswordController@reset');

});

Route::group(['namespace' => 'Api', 'prefix' => 'v1', 'middleware' => ['cors', 'json.response']], function () {

    /**
     * before auth routes
     */
    Route::post('/patient/register', 'AuthController@postRegister');
    Route::post('/patient/login', 'AuthController@postLogin');
    /**
     * Khaled awwad
     */
    Route::post('/patient/forgot-password', 'AuthController@postForgotPassword');
    Route::post('/patient/reset-password', 'AuthController@postResetPassword');

});
