<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\JsonResponse;

use App\Http\Requests\Patient\UpdatePatientRequest;
use App\Patient;

class PatientsController extends ApiController {

    /**
     * @return JsonResponse
     */
    public function getPatientInfo() {
        $patientId = auth()->guard('api')->user()->id;
        $patient = Patient::find($patientId);
        if ($patient) return $this->response('Found data', 200, $patient);
        else return $this->response('Data not found', 404);
    }

    /**
     * @param UpdatePatientRequest $request
     * @return JsonResponse
     */
    public function updatePatientInfo(UpdatePatientRequest $request) {
        $data = $request->validated();
        $patientId = auth()->guard('api')->user()->id;
        $patient = Patient::find($patientId);
        if (!$patient) return $this->response('Data not found', 404);
        $patientStatus = $patient->update($data);
        if ($patientStatus) return $this->response('Patient info updated', 200);
        else return $this->response('Something went wrong', 400);
    }

    /**
     * @return JsonResponse
     */
    public function getDoctorInfo() {
        $doctor = auth()->guard('api')->user()->doctorPatient();
        if ($doctor) return $this->response('Found data', 200, $doctor);
        else return $this->response('Data not found', 404);
    }

    /**
     * @return JsonResponse
     */
    public function getClinicInfo() {
        $patientId = auth()->guard('api')->user()->id;
        $patient = Patient::with('doctorPatient.doctor.clinic')->find($patientId);
        if ($patient) return $this->response('Found data', 200, $patient);
        else return $this->response('Data not found', 404);
    }

    /**
     * @return JsonResponse
     */
    public function getTimeReviews() {
        $patientId = auth()->guard('api')->user()->id;
        $patient = Patient::with('doctorPatient.doctor.clinic')->find($patientId);
        if ($patient) return $this->response('Found data', 200, $patient);
        else return $this->response('Data not found', 404);
    }

}
