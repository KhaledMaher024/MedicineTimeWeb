<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UserRequest extends FormRequest
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
        $id = request()->get('id') ?? 0;
        return [
            'identity_num' => 'required|numeric|digits:9|unique:users,identity_num,'.$id.',id',
            'type' => 'required|in:doctor,resceptionist,patient',
            'name' => 'required|min:6',
            'username' => 'required|min:6|unique:users,username,'.$id.',id',
            'password' => 'required|min:6',
            'clinic_id' => 'required|numeric|exists:clinics,id',
        ];
    }

}
