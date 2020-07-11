<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePatientDrugDoseHistoriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('patient_drug_dose_histories', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->foreign('drug_id')->references('id ')->on(drugs);
            $table->timestamps('used_at');
            $table->foreign('patient_id')->references('identity_num ')->on(patients);
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
        Schema::dropIfExists('patient_drug_dose_histories');
    }
}
