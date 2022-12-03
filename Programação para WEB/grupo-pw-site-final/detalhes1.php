<!DOCTYPE html>
<html lang="pt">
    <head>
        <meta charset="utf-8">
        <title>Produto | IDFOUR</title>
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
        <!-- Arquivos do slick -->
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.7.1/slick.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.7.1/slick-theme.css">

       
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
								<img id="logo-img" src="img/IDlogo.png" alt="">
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
						<li><a href="./cadastro.php">CADASTRE-SE</a></li>
					</ul>
				</div>
			</div>
		</nav>

		<!-- SECTION -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<!-- /Product main img -->
				<?php  detalhes(); ?>

						<form action="./cesta.php?link_codigo=session_id">
							<button type="submit" class="btn btn-danger col-md-12" name="link_codigo">Comprar</button></br>
						</form>
					  </div></br>
	
					     <h6>Consulte frete e disponibilidade para sua região</h6>
					  <div class="input-group">
						  <input type="text" class="form-control" pattern="[0-9]{5}-[0-9]{3}"maxlength="9" id="cepcadastro" required="required" placeholder="CEP">
						    <div class="input-group-btn">
							   <button class="btn btn-danger col-md-12" type="submit";>Consultar</button>
                                  <label class="control-label col-sm-2" for="cepcadastro">CEP:</label>
									
							</div>
					    </div>
					</div>
				</article>
					

				<!-- /Product details -->
	
				<!-- Product tab -->
				<div class="col-md-12">
					<div id="product-tab">
						<!-- product tab nav -->
						<ul class="tab-nav">
							<li class="active"><a data-toggle="tab" href="#tab1">Característica</a></li>
							<li><a data-toggle="tab" href="#tab2">Avaliações (25)</a></li>
						</ul>
						<!-- /product tab nav -->
	
						
						<div classe="topo_propaganda">
                            <img src="img/16.jpg" alt="">
							<img src="img/17.jpg" alt="">
							<img src="img/18.jpg" alt="">
							<img src="img/19.jpg" alt="">
							<img src="img/20.jpg" alt="">

						</div>
				
						<div class="col-md-12">
							<div id="product-tab">
								<ul class="tab-nav">
									<li class="active"><a data-toggle="tab" href="#tab1">Especificações</a></li>
								</ul>
							</div>
						</div>	
	
						<!-- product tab content -->
						<div class="tab-content">
							<!-- tab1  -->
							<div id="tab1" class="tab-pane fade in active">
								<div class="row">
									<div class="col-md-11">
									
										<p>Disponível em cores de tirar o fôlego, feitas especialmente para completar seu visual.
                                        Escolha entre Grafite, Azul Safira, Prata (Pulseira Branca) para Galaxy Watch5 tamanho Grande, ou Grafite,
                                        Rosé e Prata (Pulseira Azul) para Watch5 tamanho pequeno.</p></br>

                                            <b>Características:</b></br>
                                            Marca: Samsung</br>
                                            Modelo: Galaxy Watch5</br>
                                            Cor: Rosé</br>
	
                                            <b>Materiais:</b></br>
                                            Estrutura: Armor Aluminum</br>
                                            Pulseira:  Borracha Fluorelastômero</br>
											
											<b>Conectividade:</b></br>
                                            Bluetooth: Versão 5.2</br>
                                            Conexão Wi-Fi: 802.11 a/b/g/n 2.4+5GHz</br>
                                            NFC</br>
	
											<b>Bateria:</b></br>
                                            Capacidade da Bateria (mAh): 284</br>
                                            Carregamento: Sem-fio (WPC indutivo)</br>
                                            Tipo de Bateria: Ions de Lítio</br>
													
										</p>
									</div>
								</div>
							</div>				
						</div>
					</div>
				</div>		
			</div>
		</div>
		
	</div>
	
	<div class="section">
		<div class="container">
			<!-- row -->
			<div class="row">
	
				<div class="col-md-12">
					<div id="product-tab">
						<ul class="tab-nav">
							<li class="active"><a data-toggle="tab" href="#tab1">Compre Junto</a></li>
						</ul>
					</div>
				</div>	
				<!-- product -->
				<div class="col-md-3 col-xs-12">
					  <img src="img/4.jpg" alt="..." width="212.5" height="200">
					  <div class="caption">
						<h3 class="product-name"><a href="#">Carregador Turbo Samsung 45wa</a></h3>
						<h4 class="product-price">R$ 119,19</h4>
						<button type="button" class="btn btn-danger">Comprar</button>
					  </div>
				  </div>
				<!-- /product -->
	
				<!-- product -->
				<div class="col-md-3 col-xs-12">
					  <img src="img/1.jpg" alt="..." width="212.5" height="200">
					  <div class="caption">
						<h3 class="product-name"><a href="#">Smartphone Samsung Galaxy Z Flip4</a></h3>
						<h4 class="product-price">R$6.999,00</h4>
						<button type="button" class="btn btn-danger ">Comprar</button>
					  </div>
				</div>
				<!-- /product -->
	
				<div class="clearfix visible-sm visible-xs"></div>
	
				<!-- product -->
				<div class="col-md-3 col-xs-12">
					  <img src="img/5.jpg" alt="..." width="212.5" height="200">
					  <div class="caption">
							<h3 class="product-name"><a href="#">Fone de Ouvido Samsung Galaxy Buds2</a></h3>
							<h4 class="product-price">R$ 1.499,00</h4>
						<button type="button" class="btn btn-danger">Comprar</button>
					  </div>
				  </div>

				<!-- /product -->
	
				<!-- product -->
				<div class="center col-md-3 col-xs-12">
					  <img src="img/3.jpg" alt="..." width="212.5" height="200">
					  <div class="caption">
						<h3 class="product-name"><a href="#">Samsung Adaptador tipo C para Conector</a></h3>
						<h4 class="product-price">R$19,00 à vista</h4>
						<button type="button" class="btn btn-danger">Comprar</button>
					  </div>
				  </div>
				<!-- /product -->
	
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /Section -->
	

        <footer id="footer">
			<div class="section">
				<div class="container">
					<div class="row">
						<div class="col-md-3 col-xs-8">
							<div class="footer">
								<h3 class="footer-title">Atendimento</h3>
								<ul class="footer-links">
									<li><a href="#">Minha conta</a></li>
									<li><a href="#">Meus pedidos</a></li>
									<li><a href="#">Encontre uma loja</a></li>
								</ul>
							</div>
						</div>

						<div class="col-md-3 col-xs-8">
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

						<div class="col-md-3 col-xs-8">
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
		<!-- // JS - slick -->
		<script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
		<script src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.7.1/slick.js"></script>
		<script src="js/slick.js"></script>

    </body>
</html>

<?php 
	function detalhes(){
		$conexao = new mysqli("localhost","root","","id4");
		$codigo_produto = $_GET ['codigo_produto'];
		$sql = "select * from produto where codigo_produto = $codigo_produto";

		$resultado = mysqli_query($conexao, $sql);
		while($reg = mysqli_fetch_array($resultado)){
			$titulo = $reg["titulo"];
			$descritivo = $reg["descritivo"];
			$valor_produto = $reg["valor_produto"];
	

			echo "<div class='col-md-7'>
			<div id='product-main-img' class='slider-for'>
				<div class='product-preview'>
					<img src='img/a$codigo_produto.jpg' alt=''>
				</div>

				<div class='product-preview'>
					<img src='img/b$codigo_produto.jpg' alt=''>
				</div>

				<div class='product-preview'>
					<img src='img/c$codigo_produto.jpg' alt=''>
				</div>

				<div class='product-preview'>
						<img src='img/d$codigo_produto.jpg' alt=''>
				</div>
			</div>
		</div>
			<section class='col-md-5 mb-5 d-flex flex-column justify-content-right' id='produto'>
			<article class='produtos-conteudo'>
				<h2>$titulo</h2>
				<p>
				$descritivo
				</p>
			</article>
			<!-- Product thumb imgs -->
			<!-- col-md-pull-5-->
		<div class='container-fluid'>
			<div  class='col-md-10 '>
				<div id='product-imgs' class='slider-nav'>
					<div class='product-preview'>
						<img src='img/a$codigo_produto.jpg' alt=''>
					</div>

					<div class='product-preview'>
						<img src='img/b$codigo_produto.jpg' alt=''>
					</div>

					<div class='product-preview'
						<img src='img/c$codigo_produto.jpg' alt=''>
					</div>

					<div class='product-preview'>
						<img src='img/d$codigo_produto.jpg' alt=''>
					</div>
					<div class='product-preview'>
						<img src='img/e$codigo_produto.jpg' alt=''>
					</div>
				</div>
			</div>
		</div>

		<!-- /Product thumb imgs -->
		<article class='produtos-preco'>
			<div class='produtos-stars'>
				<svg width='1em' height='1em' viewBox='0 0 16 16' class='bi bi-star-fill'
					fill='currentColor' xmlns'http://www.w3.org/2000/svg'>
					<path
						d='M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z' />
				</svg>

				<svg width='1em' height='1em' viewBox='0 0 16 16' class='bi bi-star-fill'
					fill='currentColor' xmlns='http://www.w3.org/2000/svg'>
					<path
						d='M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z' />
				</svg>

				<svg width='1em' height='1em' viewBox='0 0 16 16' class='bi bi-star-fill'
					fill='currentColor' xmlns='http://www.w3.org/2000/svg'>
					<path
						d='M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z' />
				</svg>

				<svg width='1em' height='1em' viewBox='0 0 16 16' class='bi bi-star-fill'
					fill='currentColor' xmlns='http://www.w3.org/2000/svg'>
					<path
						d='M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z' />
				</svg>
			</div>

			<div>
				<h3>R$$valor_produto</h3>
				<h5>ou até 10x de R$225,90 sem juros <a href='https://parcelamento.com'>ver parcelamento</a></h5>";   
		}
		mysqli_close($conexao);
	}
?>