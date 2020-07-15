<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'users';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'identity_num', 'type', 'name', 'username', 'password', 'clinic_id',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password',
    ];

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

    public function clinic()
    {
        return $this->belongsTo(Clinic::class);
    }

    /**
     * @return HasMany
     */
    public function patients()
    {
        return $this->hasMany(DoctorPatient::class);
    }

}
