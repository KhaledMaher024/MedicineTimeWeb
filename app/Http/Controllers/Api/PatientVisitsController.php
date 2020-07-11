<?php

namespace App\Http\Controllers\Api;

use App\PatientVisit;
use Illuminate\Routing\Controller as BaseController;

class PatientVisitsController extends BaseController {

    public function getReviewTime() {
        $patientId = 1;//;auth()->user()->id;
        $visit = PatientVisit::latest()->findOrFail($patientId);
        if ($visit) return $this->response('Found data', 200, $visit);
        else return $this->response('Not found', 404);
    }

}
