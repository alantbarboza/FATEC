<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;
require './lib/vendor/autoload.php';

if(isset($_POST['btn-forgot'])):
$message = array();
$connect = new mysqli ("localhost", "root", "", "id4");
$email = mysqli_escape_string($connect, $_POST['email_recovery']);
	$sql = "SELECT nome, senha FROM cliente WHERE email = '$email'";
	$result = mysqli_query($connect, $sql);
	if(mysqli_num_rows($result) == 1):
		$data = mysqli_fetch_array($result);
		mysqli_close($connect);

		$mail = new PHPMailer(true);
		$name = $data['nome'];
		$password = $data['senha'];
		try {
		//Server settings
		$mail->isSMTP();
		$mail->Host = 'smtp.mailtrap.io';
		$mail->SMTPAuth = true;
		$mail->Port = 2525;
		$mail->Username = '293d726e4d1d9c';
		$mail->Password =  '3dc9094868915b';
		$mail->CharSet = "UTF-8";

		$mail->setFrom('recuperarsenha@idfour.com.br', 'IdFour');
		$mail->addAddress($email, $name);

		$mail->isHTML(true);
		$mail->Subject = 'Recuperar Senha';
		$mail->Body    = "Olá, $name </br></br> A senha da sua conta é: $password.";

		$mail->send();
		$message[] = '<div style="color: black;text-align:left">
		E-mail de recuperação enviado.
	  </div>';
		} catch (Exception $e) {
			$message[] = '<div style="color: black;text-align:left">
			Erro.
		</div>';
		}
	else:
		$message[] = '<div style="color: black;text-align:left">
		Usuario não existe. Dados inválidos.
		</div>';
	endif;
endif;
?>


<!DOCTYPE html>
<html lang="pt">
    <head>
        <meta charset="utf-8">
        <title>Esqueci a senha | IDFOUR</title>
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
			<li class="active"><a href="./vitrine.php">HOME</a></li>
			<li><a href="./busca.php?buscar=Telefonia">TELEFONIA</a></li>
			<li><a href="#">ELETRODOMÉSTICOS</a></li>
			<li><a href="#">TVS E VÍDEO</a></li>
			<li><a href="#">ELETROPORTÁTEIS</a></li>
			<li><a href="#">INFORMÁTICA</a></li>
			<li><a href="#">SERVIÇOS</a></li>
		  </ul>
		</div>
	  </div>
	</nav>

        <br/>

        <h3 class="login-cadastro">Esqueci a senha</h3><br/>
           
 <!-- div da caixa que guarda o formulario -->
     <div id="esqueci-container">
         <h4><b> Informe seu e-mail: </b></h4>
         <i> e-mail para reset de senha será enviado. </i>

		 <!-- div que guarda o e-mail -->
		 <div id="div-esqueci">
		 <form class="form-horizontal" action="<?php echo $_SERVER['PHP_SELF']; ?>" method='POST' id="form-senha">
          <div id="emailesqueci">
           <input type="email"
		     class="form-control"
			 required="required"
			 id="esqueciemail"
			 name='email_recovery'
			 placeholder="Digite seu e-mail">
          </div>

		  <!-- div do botão para enviar -->
          <div class="form-group">        
            <div class="col-sm-offset-2 col-sm-10">
              <br>
              <button id="esquecibtn" name="btn-forgot" type="submit" class="btn btn-danger">Enviar</button>
            </div>
          </div>
          </div>
		  </div>
		</form>
        <br/>

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
