<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Drug extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'drugs';


    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $primaryKey = 'id';


    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'image',
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
    protected $casts = [
    'created_at' => 'date:Y-m-d H:i:s',
    'updated_at' => 'date:Y-m-d H:i:s',
];
    
public function patient_drug() {
    return $this->belongsTo(PatientDrug::class);
}
public function patient_drug_history() {
    return $this->belongsTo(PatientDrugTime::class);
}

    
}
