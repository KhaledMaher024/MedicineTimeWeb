<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePatientDrugDozesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('patient_drug_dozes', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->foreign('patient_id')->references('identity_num ')->on(patients);
            $table->foreign('drug_id')->references('id ')->on(drugs);
            $table->integer('dose');
            $table->integer('number_of_usage');
            $table->string('notes');
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
        Schema::dropIfExists('patient_drug_dozes');
    }
}
