<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateClubesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('clubes', function (Blueprint $table) {
            $table->increments('id_clube');
            $table->string('nome_clube');
            $table->integer('pontos');
            $table->integer('qtd_jogos');
            $table->integer('qtd_vitorias');
            $table->integer('qtd_empates');
            $table->integer('qtd_derrotas');
            $table->integer('gols_P');
            $table->integer('gols_C');
            $table->integer('saldo_gols');            
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
        Schema::dropIfExists('clubes');
    }
}
