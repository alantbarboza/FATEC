<?php 
  session_start();
?>
<!DOCTYPE html>
<html lang="pt">
    <head>
        <meta charset="utf-8">
        <title>Login | IDFOUR</title>
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
        <li class="active"><a href="./login.php">LOGIN</a></li>
        <li><a href="./alterar.php">ALTERAR</a></li>
				<li><a href="./cadastro.php">CADASTRE-SE</a></li>
      </ul>
    </div>
  </div>
</nav>

        <br/>

        <h3 class="login-cadastro">Login</h3><br/>
        <div id="login-container" >
        <div id="login1" class="box">
          <form class="form-horizontal" method="post" action="login.php" id="form-login">
            <h5><center>Já tenho cadastro</center></h5> <br/> 
            <div class="form-group">
              <label class="control-label col-sm-2" for="email" >email:</label>
              <div class="col-sm-10">
                <input type="email"
                  class="form-control"
                  required="required"
                  name="emaillogin"
                  id="emaillogin"
                  placeholder="Digite seu e-mail">
              </div>
            </div>

            <div class="form-group">
              <label class="control-label col-sm-2" for="senhalogin">senha:</label>
              <div class="col-sm-10">          
                <input type="password"
                  class="form-control"
                  pattern="^(?=.*[A-Z])(?=.*[!#@$%&-+_(){}])(?=.*[0-9])(?=.*[a-z]).{6,25}$"
                  required="required"
                  id="senhalogin"
                  name="senhalogin"
                  placeholder="Digite sua senha">
              </div>
            </div>

            <a href="./esqueci_senha.php" target="new" color="red">
                Esqueceu a senha. 
                </a>
            <div id="btnlogin" class="form-group">        
              <div class="col-sm-offset-2 col-sm-10">
                <br>
                <button id="btnlogin1" name="btnlogin1" type="submit" class="btn btn-danger">Entrar</button>
              </div>
            </div>
          </form>
        </div>
        <div id="login2" class="box">
          <h5>Não tenho cadastro </h5>
          <i> caso não possua cadastro, clique no botão abaixo. </i> 
          <br/>
          <br/>
          <div id="btnlogin" class="form-group">        
            <div class="col-sm-offset-2 col-sm-10">
              <a href="./cadastro.php" target="new" color="red">
              <button id="btnlogin2" type="submit" class="btn btn-danger">Cadastre aqui</button>
            </a>
            </div>
          </div>
        </div>
      </div>

    <br/>

   <?php

if(isset($_POST["btnlogin1"])) logar();

Function logar(){

      $emaillogin = $_POST['emaillogin'];
      $senhalogin = $_POST['senhalogin'];

      $conexao = new mysqli("localhost","root","","id4");


  
      $sql = "SELECT * FROM cliente WHERE email = '$emaillogin' AND senha = '$senhalogin'";

      $result = mysqli_query($conexao,$sql);

            if (mysqli_num_rows($result)<=0){
              echo"<script language='javascript' type='text/javascript'>
              alert('Login e/ou senha incorretos');window.location
              .href='login.php';</script>";
              die();

            }else{
              $dados = mysqli_fetch_assoc($result);
              
              $_SESSION['usuario_logado'] = $dados['codigo_cliente'];
              setcookie("emaillogin",$emaillogin);
              echo "<script language='javascript' type='text/javascript'>
              alert('Usuário logado com sucesso.');window.location
               .href='vitrine.php';</script>";
              
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
        