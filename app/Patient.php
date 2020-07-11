<?php

namespace App;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens;

class Patient extends Authenticatable
{
    use HasApiTokens, Notifiable;

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
        'identity_num', 'gender', 'name', 'birthday', 'mobile', 'address',
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
     * Perform any actions required before the model boots.
     *
     * @return void
     */
    protected static function booting()
    {
        static::saving(function($patient) {
            $patient->password = \bcrypt($patient->password);
        });
    }

    /**
     * @return HasOne
     */
    public function doctorPatient() {
        return $this->hasOne(DoctorPatient::class);
    }

}
