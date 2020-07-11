<?php

namespace App\Http\Controllers\Api;

use Illuminate\Routing\Controller as BaseController;
use Illuminate\Http\Request;
use App\User;
use App\Http\Requests\UserRequest;

class DoctorsController extends BaseController {

    // public function generateToken(){
    //     $this->api_token = str_random(60);
    //     $this->save();
    //     return $this->api_token;
    // }

    // protected function registered(Request $request, $user) {
    //     $user->generateToken();
    //     return response()->json(['data' => $user->toArray()], 201);
    // }

    // public function register(Request $request) {
    //     $this->validator($request->all())->validate();
    //     event(new Registered($user = $this->create($request->all())));
    //     $this->guard()->login($user);
    //     return $this->registered($request, $user) ?: redirect($this->redirectPath());
    // }


    
    // public function login(LoginRequest $request) {
    //     $userId = 1;//;auth()->user()->id;
    //     $user = User::findOrFail($userId);
    //     return response()->json([
    //         'data' => $user,
    //         'status' => true,
    //     ], 200);
    // }











    public function getProfile() {
        $userId = 1;//;auth()->user()->id;
        $user = User::findOrFail($userId);
        return response()->json([
            'data' => $user,
            'status' => true,
        ], 200);
    }

    public function createProfile(UserRequest $request) {
        $data = $request->validated();
        $user = User::create($data);
        return response()->json([
            'data' => $user,
            'status' => true,
        ], 201);
    }

    public function updateProfile(UserRequest $request, $id) {
        $data = $request->validated();
        $user = User::findOrFail($id)->update($data);
        return response()->json([
            'data' => $user,
            'status' => true,
        ], 200);
    }
}
