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
     * Patient routes
     */
    Route::get('/patient/{id}', 'PatientsController@getPatientInfo');
    Route::post('/patient/{id}/edit', 'PatientsController@updatePatientInfo');
    Route::post('/patient/{id}/doctor', 'DoctorsController@getDoctorInfo');
    Route::get('/patient/{id}/clinic', 'ClinicsController@getClinicInfo');
    Route::get('/patient/{id}/reviews', 'PatientVisitsController@getReviewTime');

});
