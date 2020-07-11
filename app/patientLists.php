<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class patientLists extends Model
{
    public function user(){
        return $this->belongsTo(User::class);
    }
}
