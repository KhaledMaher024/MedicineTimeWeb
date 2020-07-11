<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
//use Illuminate\Database\Schema\Blueprint\\url;

class CreatePatExaminationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pat_examinations', function (Blueprint $table) {
            $table->foreign('patient_id')->references('identity_num ')->on(patients);
            $table->foreign('visit_id ')->references('id ')->on(pat_visiting);


            //$table->url('uploaded_image');
            //$table->string('uploaded_image');
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
        Schema::dropIfExists('pat_examinations');
    }
}
