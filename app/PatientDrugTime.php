<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PatientDrugTime extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'patient_drug_doze_histories';

    /**
     * The primary key of table associated with the model.
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
        'patient_id', 'drug_id','used_at',
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

    public function drugs() {
        return $this->hasMany(Drug::class);   
    }
    
    public function patients() {
        return $this->hasMany(Patient::class);   
    }    
}
