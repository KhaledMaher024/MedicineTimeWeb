<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {

            $table->bigIncrements('identity_num');
            $table->enum('type', array('Doctor', 'Resceptionist','patient'));
            $table->string('name')->nullable();
            $table->string('username')->nullable();
            $table->string('password');
            $table->foreign('clinic_id')->references('id ')->on(clinics);
            $table->timestamps();
            $table->string('api_token', 60)->unique()->nullable();

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->dropColumn(['api_token']);
        });
    }
}
