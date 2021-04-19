<!doctype html>
<html lang="pt-br">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="csrf-token" content="<?php echo e(csrf_token()); ?>">
    <link rel="shortcut icon" href="<?php echo e(asset('images/logo-brasileirao.png')); ?>">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
    <title>Brasileirão série A</title>
    <!-- Principal CSS do Bootstrap -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
  </head>
  <body>
    <header>
      <nav class="navbar navbar-light bg-light">
        <a class="navbar-brand" href="#">
          <img src="<?php echo e(asset('images/logo-brasileirao.png')); ?>" width="50" height="50" alt="">
        </a>
      </nav>
    </header>
    <main role="main">
      <section class="jumbotron text-center">
        <div class="container">
          <h1 class="jumbotron-heading">Brasileirão Série A</h1>
          <p class="lead text-muted">Simule o campeonato brasileiro do seu jeito!</p>
          <p>
            <!-- Botão para acionar modal -->
            <button type="button" id="btnNovoConf" class="btn btn-primary" data-toggle="modal" data-target="#modalConfronto">Novo Confronto</button>
          </p>
        </div>
      </section>
    </main>
    <div class="container-fluid">
      
      <!--TABELA COM CLUBES-->
      <table class="table table-striped" id="tbClubes">
        <thead>
          <tr>
            <th scope="col">Posição</th>
            <th scope="col"></th>
            <th scope="col"></th>
            <th scope="col"></th>
            <th scope="col">PTS</th>
            <th scope="col">J</th>
            <th scope="col">V</th>
            <th scope="col">E</th>
            <th scope="col">D</th>
            <th scope="col">GP</th>
            <th scope="col">GC</th>
            <th scope="col">SG</th>
          </tr>
        </thead>
        <tbody>   
        </tbody>
      </table>
    <!--FIM TABELA-->
    </div>
    <!--MODAL CONFRONTO-->
    <div class="modal" id="modalConfronto" tabindex="-1" role="dialog">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">Confronto</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <div class="row">
              <div class="col">
                
                <select id="inputClube1" class="form-control">
                  <option selected>Mandante</option>
                  
                </select>
              </div>
              <!--<hr class="featurette-divider">-->
              
              <div class="col-2">
                <input type="number" min="0" id="inputPlacarCasa" class="form-control align-self-center" placeholder="0">
              </div><div class="align-self-center"><i class="fas fa-futbol"></i></div>
              <div class="col-2">
                <input type="number" min="0" id="inputPlacarForaCasa" class="form-control align-self-center" placeholder="0">
              </div>
              <div class="col">
                <select id="inputClube2" class="form-control">
                  <option selected>Visitante</option>
                </select>
              </div>
            </div>            
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
            <button type="button" class="btn btn-primary" id="btnConfrontar">Salvar</button>
          </div>
        </div>
      </div>
    </div>      
    <!--FIM MODAL CONFRONTO-->
    <footer class="text-muted">
      <div class="container">
        <p class="float-right">
          <a href="#">Ir para o topo</a>
        </p>        
      </div>
    </footer>
    <!-- JavaScript do Bootstrap
    ================================================== -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>    
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <script src="<?php echo e(asset('js/pageController.js')); ?>"></script>
  </body>
</html>