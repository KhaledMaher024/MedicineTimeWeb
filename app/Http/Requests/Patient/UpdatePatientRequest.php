<?php

namespace App\Http\Requests\Patient;

use Illuminate\Foundation\Http\FormRequest;

class UpdatePatientRequest extends FormRequest
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
        $id = auth()->guard('api')->user()->id;
        return [
            'name' => 'required|min:5',
            'identity_num' => 'required|numeric|digits:9|unique:patients,identity_num,'.$id.',id,deleted_at,NULL',
            'gender' => 'required|in:male,female',
            'address' => 'required|min:5',
            'mobile' => 'required|numeric|min:9|unique:patients,mobile,'.$id.',id,deleted_at,NULL',
            'birthdate' => 'nullable|sometimes|date_format:Y-m-d',
            'username' => 'required|min:5|unique:patients,username,'.$id.',id,deleted_at,NULL',
        ];
    }

}
