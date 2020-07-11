<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PatientVisit extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'patient_visits';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'doctor_id', 'patient_id', 'visit_at', 'next_visit_at',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [];

    public function doctors() {
        return $this->hasMany(Doctor::class);
    }
}
