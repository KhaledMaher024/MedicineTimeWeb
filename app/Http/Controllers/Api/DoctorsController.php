<?php

namespace App\Http\Controllers\Api;

use App\Doctor;
use App\Http\Requests\Doctor\DoctorRequest;
use App\Http\Requests\Doctor\SyncPatientsRequest;
use Illuminate\Http\JsonResponse;

class DoctorsController extends ApiController {

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
     * @param DoctorRequest $request
     * @return JsonResponse
     */
    public function createDoctor(DoctorRequest $request) {
        $data = $request->validated();
        $doctor = Doctor::create($data);
        if ($doctor) return $this->response('Created successfully', 201, $doctor);
        else return $this->response('Something bad', 400);
    }

    /**
     * @param DoctorRequest $request
     * @param $id
     * @return JsonResponse
     */
    public function updateProfile(DoctorRequest $request, $id) {
        $data = $request->validated();
        $doctor = Doctor::find($id);
        if (!$doctor) $this->response('Not found', 404);
        $updateStatus = $doctor->update($data);
        if ($updateStatus) return $this->response('Created successfully', 200);
        else return $this->response('Something bad', 400);
    }

    /**
     * @param SyncPatientsRequest $request
     * @param $id
     * @return JsonResponse
     */
    public function syncPatients(SyncPatientsRequest $request, $id) {
        $data = $request->validated();
        $doctor = Doctor::find($id)->sync($data['patient_ids']);
        if ($doctor) return $this->response('Synced successfully', 200, $doctor);
        else return $this->response('Something bad', 400);
    }
}
