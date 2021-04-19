<?php

namespace App\Http\Controllers;

use App\Clube;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ClubeController extends Controller
{
    public function buscaClubes(){
        $clubes = \App\Clube::orderBy('pontos','desc')->orderBy('qtd_vitorias','desc')->orderBy('saldo_gols','desc')->orderBy('gols_P','desc')->get();
        return json_encode($clubes);
    }
    public function confrontar(Request $request){
        $conf = json_decode($request['conf'],true);

        $clubeC = \App\Clube::where('id_clube','=',$conf['casa'][0])->first();
        $clubeF = \App\Clube::where('id_clube','=',$conf['fora'][0])->first();
        

        //Adiciona +1 jogo para cada clube
        $clubeC->qtd_jogos+= 1;
        $clubeF->qtd_jogos+= 1;
        
        $clubeC->gols_P+= $conf['casa'][1];
        $clubeC->gols_C+= $conf['fora'][1];
        $clubeC->saldo_gols+= $conf['casa'][1];
        $clubeF->gols_C+= $conf['casa'][1];
        $clubeF->gols_P+= $conf['fora'][1];
        $clubeF->saldo_gols+= $conf['fora'][1];
        //Primeiro verifica quem ganhou e soma os pontos
        if (($conf['casa'][1])>($conf['fora'][1])) {            
            $clubeC->pontos+= 3;            
            $clubeC->qtd_vitorias+= 1;
            $clubeF->qtd_derrotas+= 1;
            
        }elseif(($conf['casa'][1])<($conf['fora'][1])){
            $clubeF->pontos+= 3;
            $clubeF->qtd_vitorias+= 1;
            $clubeC->qtd_derrotas+= 1;            
        }else{
            $clubeC->pontos+= 1;
            $clubeF->pontos+= 1;
            $clubeC->qtd_empates+= 1;
            $clubeF->qtd_empates+= 1;            
        }       
        DB::table('clubes')->where('id_clube','=',$conf['casa'][0])->update([
            'pontos'=>$clubeC->pontos,
            'qtd_jogos'=>$clubeC->qtd_jogos,
            'qtd_vitorias'=>$clubeC->qtd_vitorias,
            'qtd_empates'=>$clubeC->qtd_empates,
            'qtd_derrotas'=>$clubeC->qtd_derrotas,
            'gols_P'=>$clubeC->gols_P,
            'gols_C'=>$clubeC->gols_C,
            'saldo_gols'=>$clubeC->saldo_gols
        ]);
        DB::table('clubes')->where('id_clube','=',$conf['fora'][0])->update([
            'pontos'=>$clubeF->pontos,
            'qtd_jogos'=>$clubeF->qtd_jogos,
            'qtd_vitorias'=>$clubeF->qtd_vitorias,
            'qtd_empates'=>$clubeF->qtd_empates,
            'qtd_derrotas'=>$clubeF->qtd_derrotas,
            'gols_P'=>$clubeF->gols_P,
            'gols_C'=>$clubeF->gols_C,
            'saldo_gols'=>$clubeF->saldo_gols
        ]);
        //$placar = $conf['casa'][1]."-".$conf['fora'][1];

        //busca pela ultima rodada

        //$rodadaAtual = DB::table('rodadas')->max('id_rodada');
        //$num_conf = DB::table('confrotos')->where('id_rodada','=',$rodadaAtual)->get()->count();
        //if ($num_conf>=10) {
        //    //cria uma nova rodada
        //    $novaRodada = new \App\Rodada();
        //    $novaRodada->id_campeonato = 1;
        //    $novaRodada->num_rodada = 1;
        //}    
        
        return "ok!";
    }
}
