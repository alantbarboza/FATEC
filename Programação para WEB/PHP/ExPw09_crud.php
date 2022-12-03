<!doctype html>
<html>
  <!--produto{codigo, titulo, descritivo, valor, qtd, categoria}
      Faça o CRUD em PHP, utilizando o exemplo acima e crie a listagem da tabela-->
  <head></head>
  <body>
    <h1>PRODUTO</h1>
    <a href="listaProduto.php">voltar para lista</a>
    <form method="post" action="ExPw09_crud.php">
      codigo:
      <input type="number" id="codigo" name="codigo" /><br/>
      titulo:
      <input type="text" id="titulo" name="titulo" /><br/> 
      valor:
      <input type="number" id="valor" name="valor" pattern="[0-9]+([,\.][0-9]+)?" min="0" step="any"/><br/> 
      descritivo:
      <input type="text" id="descritivo" name="descritivo" /><br/> 
      qtd:
      <input type="number" id="qtd" name="qtd" /><br/> 
      categoria:
      <input type="text" id="categoria" name="categoria" /><br/> 

      <button name="b1">Inserir</button>    
      <button name="b2">Pesquisar</button>    
      <button name="b3">Alterar</button>    
      <button name="b4">Remover</button>    
    </form>
    <?php
      if(isset($_POST["b1"])) inserir();
      if(isset($_POST["b2"])) pesquisar($_POST["codigo"]);
      if(isset($_POST["b3"])) alterar();
      if(isset($_POST["b4"])) remover();
    ?>
  </body>
</html>    
<?php
  function inserir(){
      $titulo   =   $_POST["titulo"];
      $valor  =   $_POST["valor"];
      $descritivo    =   $_POST["descritivo"];
      $categoria =   $_POST["categoria"];
      $qtd =   $_POST["qtd"];
      $conexao = new mysqli("localhost","root","123456",
          "pwebt");
      $sql = "insert into Produto(titulo, valor,
        descritivo, categoria, qtd) values(
          '$titulo', '$valor', 
          '$descritivo', '$categoria', '$qtd')";
      mysqli_query($conexao, $sql);
      mysqli_close($conexao);
      echo "<h4>Registro inserido com sucesso!</h4>";        
  }

  

  function pesquisar($codigo){
      $conexao = new mysqli("localhost","root","123456",
      "pwebt"); 
    $sql = "select * from Produto where codigo=$codigo";
    $ret = mysqli_query($conexao, $sql);
    if($reg = mysqli_fetch_array($ret)){
      $titulo   =   $reg["titulo"];
      $valor  =   $reg["valor"];
      $descritivo    =   $reg["descritivo"];
      $categoria =   $reg["categoria"];
      $qtd =   $reg["qtd"];
      echo "<script lang='javascript'>";
      echo "titulo.value='$titulo';";
      echo "valor.value='$valor';";
      echo "codigo.value='$codigo';";
      echo "categoria.value='$categoria';";
      echo "descritivo.value='$descritivo';";
      echo "qtd.value='$qtd';";
      echo "</script>";
    } else {
      echo "<h4>Registro não existe!</h4>";  
    }  
    mysqli_close($conexao);
  }
  function alterar(){
      $codigo   =   $_POST["codigo"];
      $titulo   =   $_POST["titulo"];
      $valor  =   $_POST["valor"];
      $descritivo    =   $_POST["descritivo"];
      $categoria =   $_POST["categoria"];
      $qtd =   $_POST["qtd"];
      $conexao = new mysqli("localhost","root","123456",
          "pwebt");
      $sql = "update Produto set titulo='$titulo', 
      valor='$valor',
        descritivo='$descritivo', 
      categoria='$categoria', qtd='$qtd' 
      where codigo=$codigo";
      mysqli_query($conexao, $sql);
      mysqli_close($conexao);
      echo "<h4>Registro alterado com sucesso!</h4>";        
  }
  function remover(){
      $codigo   =   $_POST["codigo"];    
      $conexao = new mysqli("localhost","root","123456",
          "pwebt");
      $sql = "delete from Produto where codigo=$codigo";
      mysqli_query($conexao, $sql);
      mysqli_close($conexao);
      echo "<h4>Registro removido com sucesso!</h4>";        
  }
?>