<?php

namespace App\Http\Requests\Patient;

use Illuminate\Foundation\Http\FormRequest;

class RegisterPatientRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'name' => 'required|min:5',
            'identity_num' => 'required|numeric|digits:9|unique:patients,identity_num,0,id',
            'gender' => 'required|in:male,female',
            'address' => 'required|min:5',
            'mobile' => 'required|numeric|min:9|unique:patients,mobile,0,id',
            'birthdate' => 'nullable|sometimes|date_format:Y-m-d',
            'username' => 'required|min:5|unique:patients,username,0,id',
            'password' => 'required|min:5',
        ];
    }

}
