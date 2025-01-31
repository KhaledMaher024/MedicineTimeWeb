<?php

namespace App\Http\Controllers\Api;

use Illuminate\Routing\Controller as BaseController;

class ApiController extends BaseController {

    public function response($message, $statusCode, $model = null) {
        $data = [
            'status' => in_array($statusCode, [200, 201]),
            'message' => $message,
            'status_code' => $statusCode,
        ];
        if (!is_null($model)) $data['data'] = $model;
        return response()->json($data, $statusCode);
    }

}
