<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class PatientRequest extends FormRequest
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
        $id = request('id') ?? 0;
        return [
            'name' => 'required|min:5',
            'identity_num' => 'required|numeric|digits:9|unique:patients,identity_num,'.$id.',id',
            'gender' => 'required|in:male,female',
            'address' => 'required|min:5',
            'mobile' => 'required|numeric|min:9|unique:patients,mobile,'.$id.',id',
            'birthday' => 'required|date_format:Y-m-d',
            'username' => 'required|min:5|unique:patients,username,'.$id.',id',
            'password' => 'required|min:5',
        ];
    }

}
