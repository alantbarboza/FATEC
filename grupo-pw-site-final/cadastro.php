<!DOCTYPE html>
<html lang="pt">
    <head>
        <meta charset="utf-8">
        <title>Cadastro | IDFOUR</title>
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
        <li><a href="./busca.php?buscar=Telefonia">TELEFONIA</a></li>
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

        <!-- Cadastro -->
        <h3 class="login-cadastro"> Cadastro</h3><br/>
           
        <!-- div da caixa que guarda o formulario -->
     <div id="cadastro-container"> <br/>  
      <!-- inicio formulário -->

            <form class="form-horizontal" method="post" action="cadastro.php" id="form-cadastro">
              <!-- div para nome -->
                <div class="form-group">
                    <label class="control-label col-sm-2" for="nomecadastro" >nome:</label>
                    <div class="col-sm-10">
                      <input type="name"
                        class="form-control"
                        maxlength="70"
                        name="nomecadastro"
                        id="nomecadastro" 
                        pattern="[A-z ]{6,100}"
                        required="required" 
                        placeholder="Digite seu nome completo.">
                    </div>
                  </div>

                  <!-- div para e-mail -->
                <div class="form-group">
                  <label class="control-label col-sm-2" for="emailcadastro" >e-mail:</label>
                  <div class="col-sm-10">
                      <input type="email"
                      maxlength="100"
                      class="form-control"
                      name="emailcadastro"
                      id="emailcadastro"
                      required="required" 
                      placeholder="Digite seu e-mail.">
                  </div>
                  </div>

                  <!-- div para cpf -->
                  <div class="form-group">
                    <label class="control-label col-sm-2" for="cpfcadastro">CPF:</label>
                    <div class="col-sm-10">          
                      <input type="text"
                        class="form-control"
                        pattern="[0-9]{3}.[0-9]{3}.[0-9]{3}-[0-9]{2}"
                        id="cpfcadastro" 
                        name="cpfcadastro"
                        required="required" 
                        placeholder="XXX.XXX.XXX-XX">
                    </div>
                  </div>

                  <!-- div para cep -->
                  <div class="form-group">
                    <label class="control-label col-sm-2" for="cepcadastro">CEP:</label>
                    <div class="col-sm-10">          
                      <input type="text"
                        class="form-control"
                        pattern="[0-9]{5}-[0-9]{3}"
                        maxlength="9"
                        name="cepcadastro" 
                        id="cepcadastro"
                        required="required" 
                        placeholder="XXXXX-XXX">
                    </div>
                  </div>

                   <!-- div para endereço -->
                   <div class="form-group">
                    <label class="control-label col-sm-2" for="enderecocadastro">endereço:</label>
                    <div class="col-sm-10">          
                      <input type="text"
                        pattern="[A-z ]{6,100}"
                        maxlength="100"
                        class="form-control"
                        name="enderecocadastro"
                        id="enderecocadastro" 
                        required="required" 
                        placeholder="Digite seu endereço completo.">
                    </div>
                  </div>

                   <!-- div para estado -->
                <div class="form-group">
                  <label class="control-label col-sm-2" for="estadocadastro" >estado:</label>
                  <div class="col-sm-10">
                    <input type="text"
                      class="form-control"
                      name="estadocadastro" 
                      id="estadocadastro" 
                      maxlength="2"
                      required="required" 
                      placeholder="SP, RJ, MG, BR...">
                  </div>
                </div>


                    <!-- div para cidade -->
                    <div class="form-group">
                      <label class="control-label col-sm-2" for="cidadecadastro" >cidade:</label>
                      <div class="col-sm-10">
                        <input type="text"
                        maxlength="30"
                        class="form-control"
                        name="cidadecadastro" 
                        id="cidadecadastro" 
                        required="required"  
                          placeholder="Digite o nome da sua cidade.">
                      </div>
                    </div>
    

                   <!-- div para número -->
                   <div class="form-group">
                    <label class="control-label col-sm-2" for="numendcadastro">número:</label>
                    <div class="col-sm-10">          
                      <input type="text"
                        class="form-control"
                        pattern="[0-9]+$"
                        maxlength="10"
                        name="numendcadastro"
                        id="numendcadastro" 
                        required="required" 
                        placeholder="Digite o número do seu endereço.">
                    </div>
                  </div>

                  <!-- div para complemento -->
                  <div class="form-group">
                    <label class="control-label col-sm-2" for="complementocadastro">complemento:</label>
                    <div class="col-sm-10">          
                      <input type="text"
                        maxlength="30"
                        class="form-control"
                        id="complementocadastro"
                        name="ccadastro" 
                        required="required"  
                        placeholder="Digite o complemento do seu endereço.">
                    </div>
                  </div>

                  <!-- div para telefone -->
                  <div class="form-group">
                    <label class="control-label col-sm-2" for="telcadastro">telefone:</label>
                    <div class="col-sm-10">          
                      <input type="text"
                        required="required" 
                        pattern="[0-9]{4,5}-[0-9]{4}"
                        class="form-control"
                        maxlength="10"
                        name="telcadastro"
                        id="telcadastro"
                        placeholder="XXXXX-XXXX">
                    </div>
                  </div>

                  <!-- div para senha -->
                <div class="form-group">
                  <label class="control-label col-sm-2" for="senhacadastro">senha:</label>
                  <div class="col-sm-10">          
                    <input type="password"
                      pattern="^(?=.*[A-Z])(?=.*[!#@$%&-+_(){}])(?=.*[0-9])(?=.*[a-z]).{6,25}$"
                      class="form-control" 
                      id="senhacadastro"
                      name="senhacadastro" 
                      maxlength="10"
                      required="required"
                      placeholder="Digite sua senha.">
                  </div>
                </div>

                <!-- div para confirmar senha -->
                <div class="form-group">
                    <label class="control-label col-sm-2" for="confirm_senhacadastro">confirmar senha:</label>
                    <div class="col-sm-10">          
                      <input type="password"
                       class="form-control" 
                       name="confirm_senhacadastro"
                       id="confirm_senhacadastro" 
                       maxlength="10"
                       required="required" 
                       placeholder="Confirme sua senha.">
                    </div>
                  </div>

                  <!-- div para o botão Cadastrar -->
                <div class="form-group">        
                  <div class="col-sm-offset-2 col-sm-10">
                    <button id="btncadastro" name="btncadastro" class="btn btn-danger">Cadastrar</button>
                  </div>
                </div>
              </form>
        </div>

        <br/>

<?php

  if(isset($_POST["btncadastro"])) cadastrar();

function cadastrar(){

    $senhacadastro          = $_POST['senhacadastro'];
    $confirm_senhacadastro  = $_POST['confirm_senhacadastro'];

    
    if ($senhacadastro != $confirm_senhacadastro) {

      echo  "<script>alert('As senhas não conferem.');</script>";
    }

  else {      
    
  $nomecadastro        = $_POST["nomecadastro"];
  $emailcadastro       = $_POST["emailcadastro"];
  $cpfcadastro         = $_POST["cpfcadastro"];
  $cepcadastro         = $_POST["cepcadastro"];
  $enderecocadastro    = $_POST["enderecocadastro"];
  $estadocadastro      = $_POST["estadocadastro"];
  $cidadecadastro      = $_POST["cidadecadastro"];
  $numendcadastro      = $_POST["numendcadastro"];
  $ccadastro           = $_POST["ccadastro"];
  $telcadastro         = $_POST["telcadastro"];
  $senhacadastro       = $_POST["senhacadastro"];

  $conexao = new mysqli("localhost","root","","id4");

  $sql = "insert into cliente(nome,email,cpf,cep,endereco,estado,cidade,numero,complemento,telefone,senha)
  values('$nomecadastro','$emailcadastro','$cpfcadastro','$cepcadastro','$enderecocadastro','$estadocadastro',
  '$cidadecadastro','$numendcadastro','$ccadastro','$telcadastro','$senhacadastro')";

  mysqli_query($conexao,$sql);
  mysqli_close($conexao);

  echo"<script language='javascript' type='text/javascript'>
  alert('Cadastro realizado com sucesso');window.location
  .href='login.php';</script>";
  
  }
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