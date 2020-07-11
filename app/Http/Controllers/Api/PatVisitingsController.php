<?php

namespace App\Http\Controllers\Api;

use Illuminate\Routing\Controller as BaseController;
use Illuminate\Http\Request;
use App\patVisitings;
// use App\Http\Requests\PatVisitingsRequest;
use App\Http\Controllers\Auth\RegisterController;

class PatVisitingsController extends BaseController {


    public function getReviewTime() {
        $patientId = 412267825;//;auth()->user()->id;
        $patient = patVisitings::findOrFail($patientId);
        return response()->json([
            'data' => $patient,
            'status' => true,
        ], 200);
    }
    

}
