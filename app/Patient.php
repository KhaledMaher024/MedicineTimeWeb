<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Patient extends Model
{      
    
    /**
    * The table associated with the model.
    *
    * @var string
    */
   protected $table = 'patients';
   
    /**
     * The primary key for the model.
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
        static::saving(function($pationt) {
            $pationt->password = \bcrypt($pationt->password);
        });
    }

}
