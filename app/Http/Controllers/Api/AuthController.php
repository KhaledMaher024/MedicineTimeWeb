<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

use App\Http\Requests\Patient\RegisterPatientRequest;
use App\Http\Requests\Login\LoginRequest;
use App\Patient;

class AuthController extends ApiController
{

    /**
     * @param RegisterPatientRequest $request
     * @return JsonResponse
     */
    public function postRegister(RegisterPatientRequest $request)
    {
        $data = $request->validated();
        $patient = Patient::create($data);
        if ($patient) return $this->response('Your account has been created successfully', 201, $patient);
        else return $this->response('Something went wrong', 400);
    }

    /**
     * @param LoginRequest $request
     * @return JsonResponse
     */
    public function postLogin(LoginRequest $request)
    {
        $data = $request->validated();
        $patient = Patient::where('identity_num', $data['identity_num'])->first();
        if (!$patient)
        {
            return $this->response('Something went wrong', 404);
        }

        $password = $patient->password;
        if (!Hash::check($data['password'], $password))
        {
            return $this->response('Patient credentials were incorrect', 400);
        }

        $token = $patient->createToken('android');
        $patient->token = ['access_token' => $token->accessToken, 'token_type' => 'Bearer'];

        return $this->response('You have been logged in successfully', 200, $patient);
    }

    /**
     * @param Request $request
     * @return JsonResponse
     */
    public function getLogout(Request $request)
    {
        $patientId = $request->user()->id;
        $patient = Patient::find($patientId);
        if (!$patient) {
            return $this->response('No data found', 404);
        }
        $request->user()->token()->revoke();
        return $this->response('You have been logout successfully', 200);
    }

}
