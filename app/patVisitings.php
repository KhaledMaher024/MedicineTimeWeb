<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class patVisitings extends Model
{

     
    /**
    * The table associated with the model.
    *
    * @var string
    */
   protected $table = 'pat_visitings';

   /**
    * The attributes that are mass assignable.
    *
    * @var array
    */
   protected $fillable = [
      'patient-id', 'visit_at', 'next_visit_at', 'doctor_id',
   ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
   protected $hidden = ['doctor_id', 'visit_id' , 'created_at' , 'updated_at'];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
   protected $casts = [];



    public function user(){
        return $this->belongsTo(User::class);
    }
}
