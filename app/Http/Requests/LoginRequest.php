<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class LoginRequest extends FormRequest
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
            'password' => 'required|min:6',
        ];
    }

}
