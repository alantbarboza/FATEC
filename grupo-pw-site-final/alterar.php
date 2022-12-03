<!DOCTYPE html>
<html lang="pt">
    <head>
        <meta charset="utf-8">
        <title>Alterar | IDFOUR</title>
        <!--bootstrap-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		<!--icons bootstrap-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!---->
		    <link type="text/css" rel="stylesheet" href="css/style.css"/>
        <link rel="icon" href="img/IDlogo.png" type="imagem/png">

    <script lang="javascript" src="js/javascript.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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

        <div id="header" >
    <div class="container">
      <div class="col-md-3">
        <div class="header-logo">
          <a href="./vitrine.php" class="logo">
            <img  id="logo-img" src="img/IDlogo.png" alt="">
          </a>
        </div>
      </div>
      <div class="col-md-8">
        <div class="header-search">
          <form id="formulario" action="./busca.php">
            <input id="pesquisa" class="input" name="buscar" required>
                    <button type="button" class="search-btn" onclick="validaPesquisa()">Pesquisar</button>
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
        <li ><a href="./vitrine.php">HOME</a></li>
        <li><a href="#">TELEFONIA</a></li>
        <li><a href="#">ELETRODOMÉSTICOS</a></li>
        <li><a href="#">TVS E VÍDEO</a></li>
        <li><a href="#">ELETROPORTÁTEIS</a></li>
        <li><a href="#">INFORMÁTICA</a></li>
        <li><a href="#">SERVIÇOS</a></li>
        <li><a href="./login.php">LOGIN</a></li>
        <li><a href="./alterar.php">ALTERAR</a></li>
						<li class="active"><a href="./cadastro.php">CADASTRE-SE</a></li>
      </ul>
    </div>
  </div>
</nav>

        <br/>

        <!-- alterar -->
        <h3 class="login-cadastro">Alterar Cadastro</h3><br/>
           
        <!-- div da caixa que guarda o formulario -->
     <div id="cadastro-container"> <br/>  
      <!-- inicio formulário -->

            <form class="form-horizontal" method="post" action="alterar.php" id="form-cadastro">
                <!-- div para id -->
                <div class="form-group">
                    <label class="control-label col-sm-2" for="idalterar" >id:</label>
                    <div class="col-sm-10">
                      <input type="number"
                        class="form-control"
                        name="idalterar"
                        id="idalterar" 
                        placeholder="Digite o id.">
                    </div>
                  </div>

              <!-- div para nome -->
                <div class="form-group">
                    <label class="control-label col-sm-2" for="nome" >nome:</label>
                    <div class="col-sm-10">
                      <input type="name"
                        class="form-control"
                        id="nome"
                        name="nome">
                    </div>
                  </div>
                  
                  <!-- div para cep -->
                  <div class="form-group">
                    <label class="control-label col-sm-2" for="cep">CEP:</label>
                    <div class="col-sm-10">          
                      <input type="text"
                        class="form-control"
                        name="cep" 
                        id="cep">
                    </div>
                  </div>

                   <!-- div para endereço -->
                   <div class="form-group">
                    <label class="control-label col-sm-2" for="endereco">endereço:</label>
                    <div class="col-sm-10">          
                      <input type="text"
                        class="form-control"
                        name="endereco"
                        id="endereco" >
                    </div>
                  </div>

                   <!-- div para estado -->
                <div class="form-group">
                  <label class="control-label col-sm-2" for="estado" >estado:</label>
                  <div class="col-sm-10">
                    <input type="text"
                      class="form-control"
                      name="estado" 
                      id="estado">
                  </div>
                </div>


                    <!-- div para cidade -->
                    <div class="form-group">
                      <label class="control-label col-sm-2" for="cidade" >cidade:</label>
                      <div class="col-sm-10">
                        <input type="text"
                        class="form-control"
                        name="cidade" 
                        id="cidade">
                      </div>
                    </div>
    

                   <!-- div para número -->
                   <div class="form-group">
                    <label class="control-label col-sm-2" for="numero">número:</label>
                    <div class="col-sm-10">          
                      <input type="text"
                        class="form-control"
                        name="numero"
                        id="numero">
                    </div>
                  </div>

                  <!-- div para complemento -->
                  <div class="form-group">
                    <label class="control-label col-sm-2" for="complemento">complemento:</label>
                    <div class="col-sm-10">          
                      <input type="text"
                        class="form-control"
                        id="complemento"
                        name="complemento">
                    </div>
                  </div>

                  <!-- div para telefone -->
                  <div class="form-group">
                    <label class="control-label col-sm-2" for="telefone">telefone:</label>
                    <div class="col-sm-10">          
                      <input type="text"
                        class="form-control"
                        maxlength="10"
                        name="telefone"
                        id="telefone">
                    </div>
                  </div>

                  <!-- div para senha -->
                <div class="form-group">
                  <label class="control-label col-sm-2" for="senha">senha:</label>
                  <div class="col-sm-10">          
                    <input type="password"
                      class="form-control" 
                      id="senha"
                      name="senha">
                  </div>
                </div>

                  <!-- div para o botão Cadastrar -->
                <div class="form-group">        
                  <div class="col-sm-offset-2 col-sm-10">

                    <button id="btnpesquisar" name="btnalterar1" class="btn btn-danger">Pesquisar</button>
                    &nbsp;
                    &nbsp;
                    &nbsp;
                    <button id="btnalterar" name="btnalterar2" class="btn btn-danger">Alterar</button>
                  </div>
                </div>
              </form>
        </div>

        <br/>

<?php

  if(isset($_POST["btnalterar1"])) pesquisar($_POST["idalterar"]);
  if(isset($_POST["btnalterar2"])) alterar();


function pesquisar($idalterar){

  $conexao = new mysqli("localhost","root","","id4");

  $sql =  "SELECT * FROM cliente WHERE codigo_cliente = $idalterar";

  $ret = mysqli_query($conexao, $sql);

  if($reg = mysqli_fetch_array($ret)){

  $nome        = $reg["nome"];
  $cep         = $reg["cep"];
  $endereco    = $reg["endereco"];
  $estado      = $reg["estado"];
  $cidade      = $reg["cidade"];
  $numero      = $reg["numero"];
  $complemento = $reg["complemento"];
  $telefone    = $reg["telefone"];
  $senha       = $reg["senha"];
    echo "<script lang='javascript'>";
    echo "idalterar.value='$idalterar';";
    echo "nome.value='$nome';";
    echo "cep.value='$cep';";
    echo "endereco.value='$endereco';";
    echo "estado.value='$estado';";
    echo "cidade.value='$cidade';";
    echo "numero.value='$numero';";
    echo "complemento.value='$complemento';";
    echo "telefone.value='$telefone';";
    echo "senha.value='$senha';";
    echo "</script>";

  } 
  else {
    echo "<script language='javascript' type='text/javascript'>
    alert('Não possui nenhum id com esse número.');window.location
     .href='alterar.php';</script>";  
  }  
  mysqli_close($conexao);
}
   

function alterar(){

  $idalterar   = $_POST["idalterar"];
  $nome        = $_POST["nome"];
  $cep         = $_POST["cep"];
  $endereco    = $_POST["endereco"];
  $estado      = $_POST["estado"];
  $cidade      = $_POST["cidade"];
  $numero      = $_POST["numero"];
  $complemento = $_POST["complemento"];
  $telefone    = $_POST["telefone"];
  $senha       = $_POST["senha"];

$conexao = new mysqli ("localhost", "root", "", "id4");

$sql = "UPDATE cliente SET nome='$nome',
cep='$cep',endereco='$endereco',estado='$estado',cidade='$cidade',
numero='$numero',complemento='$complemento',telefone='$telefone',senha='$senha'
WHERE codigo_cliente='$idalterar'";


mysqli_query($conexao,$sql);
mysqli_close($conexao);

 
  echo "<script language='javascript' type='text/javascript'>
  alert('Alterado com sucesso.');window.location.href='alterar.php';</script>"; 

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