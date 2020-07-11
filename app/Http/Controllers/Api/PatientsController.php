<?php

namespace App\Http\Controllers\Api;

use App\Doctor;
use Illuminate\Http\JsonResponse;
use App\Patient;
use App\Http\Requests\PatientRequest;

class PatientsController extends ApiController {

    /**
     * @param $id
     * @return JsonResponse
     */
    public function getPatientInfo($id) {
        $patient = Patient::find($id);
        if ($patient) return $this->response('Found data', 200, $patient);
        else return $this->response('Not found', 404);
    }

    public function updatePatientInfo(PatientRequest $request, $id) {
        $data = $request->validated();
        $patient = Patient::findOrFail($id)->update($data);
        if ($patient) return $this->response('Found data', 200, $patient);
        else return $this->response('Not found', 404);
    }

    /**
     * @param $id
     * @return JsonResponse
     */
    public function getDoctorInfo($id) {
        $doctor = Doctor::find($id);
        if ($doctor) return $this->response('Found data', 200, $doctor);
        else return $this->response('Not found', 404);
    }

    /**
     * @param $id
     * @return JsonResponse
     */
    public function getClinicInfo($id) {
        $patient = Patient::with('doctorPatient.doctor.clinic')->find($id);
        if ($patient) return $this->response('Found data', 200, $patient);
        else return $this->response('Not found', 404);
    }

    /**
     * @param $id
     * @return JsonResponse
     */
    public function getTimeReviews($id) {
        $patient = Patient::with('doctorPatient.doctor.clinic')->find($id);
        if ($patient) return $this->response('Found data', 200, $patient);
        else return $this->response('Not found', 404);
    }

}
