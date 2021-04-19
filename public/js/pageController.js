$(document).ready(function(){
    var timesDes;       
    $("#inputClube2").prop('disabled', 'disabled');
    $("#btnNovoConf").click(function(){
        populaSelect(timesDes);
    });
    $("#btnConfrontar").click(function(){
        gravarConfronto()
    });
    $("#inputClube1").on( "change", function() {
        var idClube = $("#inputClube1").val();
        $("#inputClube2").prop('disabled', false);
        populaSelectFora(idClube,timesDes);
    });    
    carregaDadosClubes();      
    function carregaDadosClubes(){
        _token = $('meta[name="csrf-token"]').attr('content')
        //console.log(_token)
        $.ajax( {
            headers:{'X-CSRF-TOKEN': _token},
            type: "GET",
            url: '/clubes',
            data: {'_token':_token},
            cache: false,
            success: function (dadosClubes) {
                //console.log(dadosClubes);
                timesDes = JSON.parse(dadosClubes);
                populaTb(timesDes);
            }
        });        
    }    
    function populaTb(clubes){
        var pos = 1;
        var cols="";        
        for(var i = 0; i < clubes.length;i++){
            cols+="<tr>";
            if(pos>=1 && pos<=7){
                cols+="<td style='color: #0000cc;'>"+(pos++)+"°</td>";
            }else if(pos>=8 && pos<=14){                
                cols+="<td style='color: #006600;'>"+(pos++)+"°</td>";
            }else if(pos>=17 && pos<=20){
                cols+="<td style='color: #ff0000;'>"+(pos++)+"°</td>";
            }else{
                cols+="<td>"+(pos++)+"°</td>";
            }
            if(i==0){
                cols+="<td style='color: #ffcc00;'><i class='fas fa-trophy'></i></td>";
            }else if(pos>=2 && pos<=8){                
                cols+="<td style='color: #0000cc;'><i class='fas fa-globe-americas'></i></td>";
            }else if(pos>=8 && pos<=17){
                cols+="<td style='color: #006600;'><i class='fas fa-circle'></i></td>";
            }else if(pos>=17 && pos<=21){
                cols+="<td style='color: #ff0000;'><i class='fas fa-arrow-down'></i></td>";
            }else{
                cols+="<td><i class='fas fa-circle'></i></td>";
            } 
            cols+="<td><img src='/images/"+clubes[i].id_clube+".svg' width='30' height='30'></td>";
            cols+="<td>"+clubes[i].nome_clube+"</td>";
            cols+="<td>"+clubes[i].pontos+"</td>";
            cols+="<td>"+clubes[i].qtd_jogos+"</td>";
            cols+="<td>"+clubes[i].qtd_vitorias+"</td>";
            cols+="<td>"+clubes[i].qtd_empates+"</td>";
            cols+="<td>"+clubes[i].qtd_derrotas+"</td>";
            cols+="<td>"+clubes[i].gols_P+"</td>"
            cols+="<td>"+clubes[i].gols_C+"</td>";
            cols+="<td>"+clubes[i].saldo_gols+"</td>";            
            cols+="</tr>";
        }
        //console.log(cols)
        $("tbody").append(cols);
    }
    function populaSelect(clubes){       
        var opt = "";
        for(var i = 0; i < clubes.length; i++){
            opt+="<option value='"+clubes[i].id_clube+"'>"+clubes[i].nome_clube+"</option>";
        }
        $("#inputClube1").append(opt);
    }
    function populaSelectFora(id, clubes){
        var opt = "";
        for(var i = 0; i < clubes.length; i++){
            if (id != clubes[i].id_clube) {
                opt+="<option value='"+clubes[i].id_clube+"'>"+clubes[i].nome_clube+"</option>";    
            }            
        }
        $("#inputClube2").append(opt);
    }
    function gravarConfronto(){
        var obj = {
            casa: [$("#inputClube1").val(),$('#inputPlacarCasa').val()],
            fora: [$("#inputClube2").val(),$('#inputPlacarForaCasa').val()]
        }
        var conf = JSON.stringify(obj)
        token = $('meta[name="csrf-token"]').attr('content')
        //console.log(_token)
        $.ajax( {
            headers:{'X-CSRF-TOKEN': _token},
            type: "POST",
            url: '/clubes/confrontar',
            data: {'conf': conf,'_token':_token},
            cache: false,
            success: function (data) {
                console.log(data);
            }
        });        
        $('#modalConfronto').modal('hide'); 
        $('#tbClubes tbody > tr').remove();
        carregaDadosClubes();
    }
});