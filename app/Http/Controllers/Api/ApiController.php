<?php

namespace App\Http\Controllers\Api;

use Illuminate\Routing\Controller as BaseController;
use Illuminate\Http\Request;
use App\User;
use App\Http\Requests\UserRequest;

class ApiController extends BaseController {

    public function response($message, $statusCode, $model = null) {
        return response()->json([
            'status' => in_array($statusCode, [200, 201]),
            'message' => $message,
            'status_code' => $statusCode,
            'data' => $model,
        ], $statusCode);
    }

}
