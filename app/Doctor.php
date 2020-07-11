<?php

namespace App;

class Doctor extends Model
{

   /**
    * The table associated with the model.
    *
    * @var string
    */
   protected $table = 'doctors';

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
   protected $casts = [
   ];

   public function clinic() {
      return $this->belongsTo(Clinic::class);
   }

}
