<?php

namespace App\Http\Controllers\Api;

use App\Clinic;
use Illuminate\Http\JsonResponse;

class ClinicsController extends ApiController {

    /**
     * @param $id
     * @return JsonResponse
     */
    public function getClinicInfo($id) {
        $clinic = Clinic::find($id);
        if ($clinic) return $this->response('Found data', 200, $clinic);
        else return $this->response('Not found', 404);
    }

}
