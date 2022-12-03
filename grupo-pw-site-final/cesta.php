<?php 
  session_start();
?>
<!DOCTYPE html>
<html lang="pt">
    <head>
        <meta charset="utf-8">
        <title>Carrinho | IDFOUR</title>
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
						 
						<li><a href="./alterar.php">ALTERAR</a></li>';
						
						<li><a href="./cadastro.php">CADASTRE-SE</a></li>
					</ul>
				</div>
			</div>
		</nav>
		
		<div id="geral" class="container">
			<h1 class="titulo">Cesta<i Class="fa fa-shopping-cart"></i></h1>                                                                                    
			<div id="tela" class="table-responsive">          
				<table class="table">
					<thead >
						<tr id="topicos">
							<th class="col-sm-4">Produto</th>
							<th class="col-sm-5">Quantidade</th>
							<th class="col-sm-5">Valor</th>
							<th class="col-sm-5">Acumulado</th>
						</tr>
					</thead>
					<?php cesta();?>		
				</table>		
			</div>	
		<div class="container">
		<div id="botoes" class="center container button-responsive " >        
		<a href="vitrine.php"><button type="button" class="btn btn-danger" data-toggle="modal" 
				 data-target="#myModal1"> Comprar mais</button></a>
				<form method="post" action="#">
					<button name="btLimp" type="submit" class="btn btn-danger"data-target="#myModal">Limpar cesta</button>
                </form>
				<form method="post">
					<button name="btFinalizar" type="submit" class="btn btn-success">Finalizar</button>
				</form>
		</div>
		<?php

		if(isset($_POST["btLimp"]))limparCesta();
		if(isset($_POST["btFinalizar"]))finalizarCompra();
		function limparCesta(){ 
			$id = $_SESSION['usuario_logado'];

			$conexao = new mysqli("localhost","root","","id4");
			//$cod_cliente = $_POST['codigo_cliente'];
			$sql = "delete from cesta where codigo_cliente = $id";
			//A cima Inserir utilizar "session_id= session_id" ao invés do 2
			mysqli_query($conexao, $sql) or die("ERRO ao consultar" . mysqli_error);
			mysqli_close($conexao);

			cesta();
			 
			
		}	
		
		function finalizarCompra(){
			session_destroy();
			echo "<script language='javascript' type='text/javascript'>
		  	alert('Compra finalizada com sucesso!');
		  	window.location.href='vitrine.php'; 
		  	</script>";
		}

		?>
		<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
		
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<h4 class="modal-title">Atençao!!</h4>
			</div>
			<div class="modal-body">
			<p>A cesta será esvaziada</p>
			</div>
			<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
			</div>
		</div>
		</div>
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

	function cesta(){
		if(!$_SESSION['usuario_logado'])
			echo "<script language='javascript' type='text/javascript'>
			alert('Acesso negado');
			window.location.href='vitrine.php'; 
			</script>";
		$conexao = new mysqli("localhost","root","","id4");
		$id = $_SESSION['usuario_logado'];



		$sql = "SELECT COUNT(t2.titulo) as quantidade, t2.titulo, t2.quantidade_produto, t2.valor_produto
		FROM cesta t1 INNER JOIN produto t2 
			ON t1.codigo_produto = t2.codigo_produto WHERE t1.codigo_cliente = $id group by t2.titulo";
				

		$resultado = mysqli_query($conexao, $sql);
		//fetch_array pegando os valores das colunas do banco de dados 
		//armazenando eles na varável resultado
		// R$ <?php echo number_format($dados['valor_produto'],2, ",",".") 
		$valor_total = 0;
		if($resultado->num_rows > 0){
			while($reg = mysqli_fetch_array($resultado)){
					$titulo = $reg["titulo"];
					$valor_produto = $reg["valor_produto"];
					$quantidade_produto = $reg["quantidade"];
					$val_total_prod = $quantidade_produto * $valor_produto;
					$valor_total += $val_total_prod; 
					echo "<div>
							<tr>
							<h4>
							<td>$titulo</td>
							<td>$quantidade_produto</td>
							<td>R$ ".number_format($valor_produto, 2 ,',','.')."</td>
							<td>R$ ".number_format($val_total_prod, 2,",",".")."</td>
							</h4>	
							<tr>
							</tr>
							</tr>   
						</div>";
				}
					echo"<tr>
					<td>Valor Total:</td>
					<td></td>
					<td></td>
					<td>R$ ". number_format($valor_total, 2,',','.')."</td>
					</tr>";
		}
		
		mysqli_close($conexao); 
	}
?>
