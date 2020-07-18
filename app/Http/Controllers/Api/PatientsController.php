<?php

namespace App\Http\Controllers\Api;

use App\Http\Requests\Patient\ChangePasswordRequest;
use Illuminate\Http\JsonResponse;

use App\Http\Requests\Patient\UpdatePatientRequest;
use Illuminate\Support\Facades\Hash;

class PatientsController extends ApiController
{

    /**
     * @return JsonResponse
     */
    public function getPatientInfo()
    {
        $patient = auth()->guard('api')->user()->with(['doctors.clinic', 'drugs'])->get();
        if ($patient) return $this->response('Found data', 200, $patient);
        else return $this->response('Data not found', 404);
    }

    /**
     * @param UpdatePatientRequest $request
     * @return JsonResponse
     */
    public function updatePatientInfo(UpdatePatientRequest $request)
    {
        $data = $request->validated();
        $patient = auth()->guard('api')->user();
        if (!$patient) return $this->response('Data not found', 404);
        $patientStatus = $patient->update($data);
        if ($patientStatus) return $this->response('Patient info updated', 200);
        else return $this->response('Something went wrong', 400);
    }

    /**
     * @return JsonResponse
     */
    public function getDrugsDose()
    {
        // TODO implement drug dose list for the patient

    }

    /**
     * @return JsonResponse
     */
    public function getLogout()
    {
        $patient = auth()->guard('api')->user();
        if (!$patient) {
            return $this->response('No data found', 404);
        }
        $patient->token()->revoke();
        return $this->response('You have been logout successfully', 200);
    }

    /**
     * @param ChangePasswordRequest $request
     * @return JsonResponse
     */
    public function updatePatientPassword(ChangePasswordRequest $request)
    {
        // TODO implement this function to update the password for the patient

        $data = $request->validated();
        $pass = $request->input('password');
        $pass_confirmation = $request->input('password_confirmation');
        if ($pass == $pass_confirmation){
            return $this->response('password dosent match with confirmation', 400);
        }else{
            $patient = auth()->guard('api')->user();
            if (!$patient) return $this->response('Data not found', 404);
            $patientPassStatus = $patient->toQuery()->update([
                'password'=> $pass ,
            ]);
            if ($patientPassStatus) return $this->response('Patient info updated', 200);
            else return $this->response('Something went wrong', 400);
        }
    }

}
