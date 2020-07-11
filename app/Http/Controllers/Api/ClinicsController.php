<?php

namespace App\Http\Controllers\Api;

use App\Doctor;
use App\Http\Requests\Doctor\DoctorRequest;
use App\Http\Requests\Doctor\SyncPatientsRequest;
use Illuminate\Http\JsonResponse;

class ClinicsController extends ApiController {

    /**
     * @param $id
     * @return JsonResponse
     */
    public function getClinicInfo($id) {
        $clinic = Doctor::find($id);
        if ($clinic) return $this->response('Found data', 200, $clinic);
        else return $this->response('Not found', 404);
    }

}
