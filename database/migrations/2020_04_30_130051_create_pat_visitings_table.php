<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePatVisitingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pat_visitings', function (Blueprint $table) {
            $table->bigIncrements('visit_id');
            $table->foreign('doctor_id')->references('identity_num ')->on(users);
            $table->foreign('patient_id')->references('identity_num ')->on(patients);
            $table->timestamps('visit_at');
            $table->timestamps('next_visit_at');

            $table->timestamps();


        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('pat_visitings');
    }
}
