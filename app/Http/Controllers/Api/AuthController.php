<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Hash;

use App\Http\Requests\Patient\RegisterPatientRequest;
use App\Http\Requests\Login\LoginRequest;
use App\Models\Patient;

class AuthController extends ApiController
{

    /**
     * @param RegisterPatientRequest $request
     * @return JsonResponse
     */
    public function postRegister(RegisterPatientRequest $request)
    {
        $data = $request->validated();
        $data['password'] = Hash::make($data['password']);
        $patient = Patient::create($data);
        if ($patient) {
            $token = $patient->createToken('android');
            $patient->token = [
                'access_token' => $token->accessToken,
                'token_type' => 'Bearer'
            ];
            return $this->response('Your account has been created successfully', 201, $patient);
        } else {
            return $this->response('Something went wrong', 400);
        }
    }

    /**
     * @param LoginRequest $request
     * @return JsonResponse
     */
    public function postLogin(LoginRequest $request)
    {
        $data = $request->validated();
        $patient = Patient::where('identity_num', $data['identity_num'])->orWhere('username', $data['username'])->first();
        if (!$patient) {
            return $this->response('Something went wrong', 404);
        }

        $password = $patient->password;
        if (!Hash::check($data['password'], $password)) {
            return $this->response('Patient credentials were incorrect', 400);
        }

        $token = $patient->createToken('android');
        $patient->token = [
            'access_token' => $token->accessToken,
            'token_type' => 'Bearer'
        ];

        return $this->response('You have been logged in successfully', 200, $patient);
    }

}
