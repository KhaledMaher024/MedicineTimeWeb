<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class DoctorPatient extends Model
{

    /**
    * The table associated with the model.
    *
    * @var string
    */
   protected $table = 'doctor_patients';

   /**
    * The attributes that are mass assignable.
    *
    * @var array
    */
    protected $fillable = [
        'doctor_id', 'patient_id'
    ];

    /**
     * Indicates if the model should be timestamped.
     *
     * @var bool
     */
    public $timestamps = true;

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

    /**
     * @return belongsTo
     */
    public function doctor() {
        return $this->belongsTo(Doctor::class);
    }

    /**
     * @return belongsTo
     */
    public function patient() {
        return $this->belongsTo(Patient::class);
    }

}
