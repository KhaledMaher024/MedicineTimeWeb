<?php

namespace App\Http\Controllers\Api;

use App\Models\Doctor;
use Illuminate\Http\JsonResponse;

class DoctorsController extends ApiController {

    /**
     * @return JsonResponse
     */
    public function getDoctors() {
        // TODO get the list of all doctors with a clinic information
    }

    /**
     * @param $doctorId
     * @return JsonResponse
     */
    public function getDoctorInfo($doctorId) {
        // TODO as a function which have a name of "getPatientInfo" on the patient controller go forward to implement this function
    }

}
