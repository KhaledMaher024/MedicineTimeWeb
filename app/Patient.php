<?php

namespace App;

use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Database\Eloquent\Relations\HasOne;
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
     * Perform any actions required before the model boots.
     *
     * @return void
     */
    protected static function booting()
    {
        static::saving(function($patient) {
            $patient->password = bcrypt($patient->password);
        });
    }

    /**
     * @return HasOne
     */
    public function doctorPatient() {
        return $this->hasOne(DoctorPatient::class);
    }

}
