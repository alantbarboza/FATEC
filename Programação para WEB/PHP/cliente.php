<!doctype html>
<html>
    <head></head>
    <body>

	//enviando dados via link: GET
        <a href = "cliente.php?nome=maria&idade=25&tel=2344-2344">Ver dados</a>
        <h1>Teste PHP</h1>

        <!--  
        formulario:  
        method: tipo de envio
            -> POST: envia dados via formulario
            -> GET:  envia dados via link
        action: página que irá receber os dados enviados
        name: identifica qual botão foi clicado
        
        <form method="post" action="pw08.php">
            n1:<input type="number" id="n1" name="n1" /><br/>
            n2:<input type="number" id="n2" name="n2" /><br/>
            <button name="bt1">Calcular</button>
        </form>
		-->

        <?php
            /*
            // Caminho fisico (quando for salvar o arquivo) - criar , modificar , copiar
            // c:\xampp\htdocs\pw08.php

            // Caminho virtual (quando for ver a pagina no navegador)- executar , testar
            // ---> o arquivo deve estar dentro de C:\xampp\htdocs\
            // http://localhost/pw08.php

            // -> O código php vai ser executado pelo apache
            // -> $variavel
            

            // chamando uma função:
            //media(5,7);

            // isset: se o botão for clicado retornará true e chamará a função
            if(isset($_POST["bt1"])) media(5,7);

            // ler dados passados via GET
            lerDados();

            // inclue um arquivo que será o rodape
            include 'rodape.php';
			*/
        ?>

    <h1>Cliente</h1>
    <a href="listaCliente.php">voltar para lista</a>
    <form method="post" action="cliente.php">
		codigo:
		<input type="number" id="codigo" name="codigo" /><br/>
		nome:
		<input type="text" id="nome" name="nome" /><br/> 
		email:
		<input type="email" id="email" name="email" /><br/> 
		senha:
		<input type="password" id="senha" name="senha" /><br/> 
		cep :
		<input type="text" id="cep" name="cep" /><br/> 
		logradauro:
		<input type="text" id="logradouro" name="logradouro" /><br/> 
		cidade :
		<input type="text" id="cidade" name="cidade" /><br/> 
		telefone:
		<input type="text" id="telefone" name="telefone" /><br/> 
		<button name="b1">Inserir</button>    
		<button name="b2">pesquisar</button>    
		<button name="b3">alterar</button>    
		<button name="b4">remover</button>    
	</form>
    <?php
		if(isset($_POST["b1"])) inserir();
		if(isset($_POST["b2"])) pesquisar($_POST["codigo"]);
		if(isset($_POST["b3"])) alterar();
		if(isset($_POST["b4"])) remover();
		//caso tenha algum codigo na url, ele irá chamar a funçao pesquisar
		if(isset($GET["codigo"])) pesquisar($_GET["codigo"]);
    ?>
    </body>
</html>  
<?php
	/*encapsular funções: para não aparecer no HTML gerado pelo navegador*/
	function media($a , $b){
		//vetor: recuperando o valor passado nesse botão
		$c = $_POST["n1"];
		$d = $_POST["n2"];
		//$a = 6;
		//$b = 7;
		$c = ($a + $b) / 2;
		echo "<h3>A media = $c </h3>"; //cria uma string concatenada inserida no HTML
		if($c >= 6){
			echo "<h3>Aprovado. A media = $c </h3>";
		}else{
			echo "<h3>Reprovado. A media = $c </h3>";
		}
	}

	function lerDados(){
		//verifica se tem algum valor passado
		if(isset($_GET["nome"])){
			$nome = $_GET["nome"];
			$idade = $_GET["idade"];
			$tel = $_GET["tel"];
			echo "<b>Nome</b>:$nome<br/>";
			echo "<b>Idade</b>:$idade<br/>";
			echo "<b>Tel</b>:$tel<br/>";
		}else{
			echo "<h1>Dados invalidos</h1>";
		}
	}



	function inserir(){
		$nome   =   $_POST["nome"];
		$email  =   $_POST["email"];
		$senha  =   $_POST["senha"];
		$telefone   =   $_POST["telefone"];
		$cep    =   $_POST["cep"];
		$cidade =   $_POST["cidade"];
		$logradouro =   $_POST["logradouro"];
		//conectando ao banco de dados: MySQL Workbench
		$conexao = new mysqli("localhost","root","123456","pwebt");
		$sql = "insert into cliente(nome, email, senha,
		telefone, cep, cidade, logradouro) values(
		   '$nome', '$email', md5('$senha'), '$telefone','$cep', '$cidade', '$logradouro')"; //md5: função para criptografar no banco de dados
		//executando
		mysqli_query($conexao, $sql);
		mysqli_close($conexao);
		echo "<h4>Registro inserido com sucesso!</h4>"; 
	}
	function pesquisar($codigo){
		$conexao = new mysqli("localhost","root","123456",
		"pwebt"); 
	  $sql = "select * from cliente where codigo=$codigo";
	  $ret = mysqli_query($conexao, $sql);
	  if($reg = mysqli_fetch_array($ret)){
		$nome   =   $reg["nome"];
		$email  =   $reg["email"];
		$senha  =   $reg["senha"];
		$telefone  =   $reg["telefone"];
		$cep    =   $reg["cep"];
		$cidade =   $reg["cidade"];
		$logradouro =   $reg["logradouro"];
		echo "<script lang='javascript'>";
		echo "nome.value='$nome';";
		echo "email.value='$email';";
		echo "codigo.value='$codigo';";
		echo "cidade.value='$cidade';";
		echo "cep.value='$cep';";
		echo "telefone.value='$telefone';";
		echo "logradouro.value='$logradouro';";
		echo "</script>";
	  } else {
		echo "<h4>Registro não existe!</h4>";  
	  }  
	  mysqli_close($conexao);
	}
	function alterar(){
		$codigo   =   $_POST["codigo"];
		$nome   =   $_POST["nome"];
		$email  =   $_POST["email"];
		$senha  =   $_POST["senha"];
		$telefone   =   $_POST["telefone"];
		$cep    =   $_POST["cep"];
		$cidade =   $_POST["cidade"];
		$logradouro =   $_POST["logradouro"];
		$conexao = new mysqli("localhost","root","123456",
			"pwebt");
		$sql = "update cliente set nome='$nome', 
		email='$email', senha= md5('$senha'),
		 telefone='$telefone', cep='$cep', 
		 cidade='$cidade', logradouro='$logradouro' 
		 where codigo=$codigo";
		mysqli_query($conexao, $sql);
		mysqli_close($conexao);
		echo "<h4>Registro alterado com sucesso!</h4>";        
	}
	function remover(){
		$codigo   =   $_POST["codigo"];    
		$conexao = new mysqli("localhost","root","123456",
			"pwebt");
		$sql = "delete from cliente where codigo=$codigo";
		mysqli_query($conexao, $sql);
		mysqli_close($conexao);
		echo "<h4>Registro removido com sucesso!</h4>";        
	}
?>