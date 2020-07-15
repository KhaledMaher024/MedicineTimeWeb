<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens;

class Patient extends Authenticatable
{
    use HasApiTokens, Notifiable, SoftDeletes;

    /**
    * The table associated with the model.
    *
    * @var string
    */
   protected $table = 'patients';

    /**
    * The attributes that are mass assignable.
    *
    * @var array
    */
    protected $fillable = [
        'identity_num', 'name', 'username', 'password', 'mobile', 'address', 'birthdate', 'gender'
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
    protected $hidden = ['password', 'deleted_at'];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'birthdate' => 'date:Y-m-d',
        'created_at' => 'date:Y-m-d H:i:s',
        'updated_at' => 'date:Y-m-d H:i:s',
    ];

    /**
     * @return BelongsToMany
     */
    public function doctors() {
        return $this->belongsToMany(Doctor::class)->withPivot('visit_at')->as('patient_visit');
    }

    /**
     * @return BelongsToMany
     */
    public function drugs() {
        return $this->belongsToMany(Drug::class)->withPivot('dose', 'number_of_usage', 'notes')->as('drug_info');
    }

    public function patient_Drug() {
        return $this->belongsTo(PatientDrug::class);
    }

    public function patient_drug_history() {
        return $this->belongsTo(PatientDrugTime::class);
    }
    

}
