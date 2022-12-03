<!DOCTYPE html>
<html lang="pt">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!--bootstrap-->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <!--icons bootstrap-->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <!---->
  <link type="text/css" rel="stylesheet" href="css/style.css" />
  <link rel="icon" href="img/IDlogo.png" type="imagem/png">
  <!-- <link type="text/css" rel="stylesheet" href="css/style.css" /> -->

  <script lang="javascript" src="js/javascript.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <title>Busca | IDFOUR</title>
</head>

<body>
  <header>
    <div id="top-header">
      <div class="container">
        <ul class="header-links pull-right">
          <li></li>
          <li><a href="./login.php"><i class="fa fa-user-o"></i>Minha Conta</a></li>
        </ul>
      </div>
    </div>

    <div id="header">
      <div class="container">
        <div class="col-md-3">
          <div class="header-logo">
            <a href="./vitrine.php" class="logo">
              <img id="logo-img" src="img/IDlogo.png" alt="">
            </a>
          </div>
        </div>
        <div class="col-md-8">
          <div class="header-search">
            <form id="frm" action="./busca.php">
              <input id="pesquisa" class="input" name="buscar" required>
              <button  class="search-btn" onclick="validaPesquisa()">Pesquisar</button>
            </form>
          </div>
        </div>
        <div class="col-md-1 ">
          <div class="box-carrinho-menu pull-right">
            <div class="header-carrinho">
              <a href="./cesta.php">
                <i class="fa fa-shopping-cart"></i>
                <span>Carrinho</span>
                 
              </a>
            </div>
            <div class="menu-toggle" onclick="MenuToggle();">
              <a href="#">
                <i class="fa fa-bars"></i>
                <span>Menu</span>
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </header>

  <nav id="navigation">
    <div class="container">
      <div id="responsivo-nav">
        <ul class="main-nav nav navbar-nav">
        	<li><a href="./vitrine.php">HOME</a></li>
          <li><a href="./busca.php?buscar=Telefonia">TELEFONIA</a></li>
						<li><a href="#">ELETRODOMÉSTICOS</a></li>
						<li><a href="#">TVS E VÍDEO</a></li>
						<li><a href="#">ELETROPORTÁTEIS</a></li>
						<li><a href="#">INFORMÁTICA</a></li> 
						<li><a href="#">SERVIÇOS</a></li>
						<li><a href="./login.php">LOGIN</a></li>
            <li><a href="./alterar.php">ALTERAR</a></li>
						<li><a href="./cadastro.php">CADASTRE-SE</a></li>
        </ul>
      </div>
    </div>
  </nav>
  <?php
    if(!isset($_GET['buscar'])){
  ?>
      <h1>Erro ao realizar pesquisa... por favor tente novamente mais tarde '-'</h1>
    <?php 
      }else{
        $conexao = new mysqli("localhost","root","","id4");
        $pesquisar = $_GET['buscar'];
        $sql_code = "SELECT * 
        FROM produto
        WHERE titulo LIKE '%$pesquisar%'
        OR descritivo LIKE '%$pesquisar%'
        OR descritivo LIKE '$pesquisar%'
        OR categoria LIKE '%$pesquisar%'";
        $sql_query = mysqli_query($conexao, $sql_code) or die("ERRO ao consultar" . mysqli_error);
        if($sql_query->num_rows == 0){
          ?>
          <h1>Busca não encontrada...</h1>
        <?php
        }else{
          ?>
          <div class="container page-header">
            <h1>Busca por: <strong><?php echo $pesquisar ?></strong> </h1>
          </div> 
          <div class="container">
            <div class="row">
                <?php
                while($dados = $sql_query->fetch_assoc()){
                  $dados['valor_produto'] > 400? $juros = 10: $juros = 2;
                  
                ?>
                  <div  class="col-md-3 col-sm-3 col-xs-6">
                    
                      <img src='img/<?php echo $dados['codigo_produto']?>.jpg' alt='...' width='212.5' height='170'>
                      
                        <div class="caption">
                          <h3 class="product-name"><a href="./detalhes.php"><?php echo $dados['titulo']?></a></h3>
                          <h4 class="product-price">R$ <?php echo number_format($dados['valor_produto'],2, ",",".") ?></h4>
                          <!-- echo number_format("1000000",2,",","."); 
                              echo numer_format($dado['valor_produto'],2,",",".");
                          -->
                          <hr>
                          <p> ou até <?php echo $juros ?>x de R$ <?php echo number_format($dados['valor_produto'] / $juros,2,",",".")?></p>
                          <span>*Sem juros</span>
                          <p><a href="./detalhes.php?codigo_produto=<?php echo $dados['codigo_produto']?>"  class="btn btn-danger btn-block" role="button">Detalhes</a></p>
                        </div>
                    </div>
                  <?php
          }
          ?>
            </div>
          </div>
        <?php
          mysqli_close($conexao);
        }
        ?>
    <?php    
      }

    ?>



  <footer id="footer">
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-3 col-xs-6">
            <div class="footer">
              <h3 class="footer-title">Atendimento</h3>
              <ul class="footer-links">
                <li><a href="#">Minha conta</a></li>
                <li><a href="#">Meus pedidos</a></li>
                <li><a href="#">Encontre uma loja</a></li>
              </ul>
            </div>
          </div>

          <div class="col-md-3 col-xs-6">
            <div class="footer">
              <h3 class="footer-title">Serviços</h3>
              <ul class="footer-links">
                                  <li><a href="#">Minhas listas</a></li>
                                  <li><a href="#">Marketplace</a></li>
                                  <li><a href="#">Apoio ao seller</a></li>
                                  <li><a href="#">Perguntas frequentes</a></li>
                <li><a href="#">Central de Privacidade</a></li>
              </ul>
            </div>
          </div>

          <div class="clearfix visible-xs"></div>

          <div class="col-md-3 col-xs-6">
            <div class="footer">
              <h3 class="footer-title">Institucional</h3>
              <ul class="footer-links">
                                  <li><a href="#">Grupo IDFOUR</a></li>
                                  <li><a href="#">Trabalhe conosco</a></li>
                                  <li><a href="#">Black Friday</a></li>
                                  <li><a href="#">Mapa de Produtos</a></li>
                <li><a href="#">Mapa do Site</a></li>
              </ul>
            </div>
          </div>

          <div class="col-md-3 col-xs-6">
            <div class="footer">
              <h3 class="footer-title">Políticas IDFOUR</h3>
              <ul class="footer-links">
                                  <li><a href="#">Política de entregas</a></li>
                                  <li><a href="#">Política de Trocas e Devoluções</a></li>
                                  <li><a href="#">Política de Cancelamento e Ressarcimento</a></li>
                                  <li><a href="#">Política Retire na Loja</a></li>
                <li><a href="#">Termos de Uso</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div id="bottom-footer" >
      <div class="container">
        <div class="row">
          <div class="col-md-12 text-center">
                          <p>Desenvolvido por <i>Alan , Alberto , Beatris , Bianca e Thiago.</i></p>
            <p>2022 &copy Todos os direitos reservados.</p>
          </div>
        </div>
      </div>
    </div>
  </footer>
</body>

</html>
