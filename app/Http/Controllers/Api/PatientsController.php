<?php

namespace App\Http\Controllers\Api;

use Illuminate\Routing\Controller as BaseController;
use Illuminate\Http\Request;
use App\Patient;
use App\Http\Requests\PatientRequest;
// use App\Http\Controllers\Auth\RegisterController;

class PatientsController extends BaseController {

    public function updatePatientProfile(PatientRequest $request, $id) {
        $data = $request->validated();
        $patient = Patient::findOrFail($id)->update($data);
        return response()->json([
            'data' => $patient,
            'status' => true,
        ], 200);
    }

}
