<!DOCTYPE html>
<html lang="pt">
    <head>
	<meta charset="utf-8">
        <title>IDFOUR</title>
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
						<div class="header-logo treme">
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
						<li><a href="./login.php">LOGIN</a></li>
						<li><a href="./alterar.php">ALTERAR</a></li>
						<li><a href="./cadastro.php">CADASTRE-SE</a></li>
					</ul>
				</div>
			</div>
		</nav>

			<div id="carrossel" class="container">
				<a href="./detalhes.php?codigo_produto=1">
					<div id="myCarousel" class="carousel slide" data-ride="carousel">
						<!-- ordem das imagens -->
						<ol class="carousel-indicators">
							<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
							<li data-target="#myCarousel" data-slide-to="1"></li>
							<li data-target="#myCarousel" data-slide-to="2"></li>
						</ol>
					
						<!--slides-->
						<div class="carousel-inner">
							<div class="item active">
								<img src="img/banner.jpg" alt="Smartphone Samsung Galaxy Z" style="width:100%;">
							</div>
					
							<div class="item">
								<img src="img/banner.jpg" alt="Smartphone Samsung Galaxy Z" style="width:100%;">
							</div>
						
							<div class="item">
								<img src="img/banner.jpg" alt="Smartphone Samsung Galaxy Z" style="width:100%;">
							</div>
						</div>
					</div>
				</a>
			</div>

		<div class="section">
			<div class="container">
				<div class="row">
					<?php  listar(); ?>
				</div>
			</div>
		</div>

		

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

<?php 
	//listar os produtos em DESTAQUE
	function listar(){
		$conexao = new mysqli("localhost","root","","id4");
		
		$sql = "select * from produto where destaque = 1";

		$resultado = mysqli_query($conexao, $sql);
		while($reg = mysqli_fetch_array($resultado)){
			$codigo_produto = $reg["codigo_produto"];
			$titulo = $reg["titulo"];

			echo "<div class='col-md-4 col-xs-6'>
						<div class='shop'>
							<div class='shop-img'>
								<img src='img/$codigo_produto.jpg' alt='' width='239' height='280'>
							</div>
							<div class='shop-body'>
								<h3>$titulo</h3>
								<a href='./detalhes.php?codigo_produto=$codigo_produto' class='cta-btn'>Compre agora <i class='fa fa-arrow-circle-right'></i></a>
							</div>
						</div>
					</div>";   
		}
		mysqli_close($conexao);
	}
?>