<!doctype html>
<html>
    <body>
    <!--
        Utilizando a tabela PRODUTO da atividade PW9 crie uma pagina de listagem utilizando uma tabela com um campo 
        de pesquisa, crie uma coluna que contenha um link para a pagina de crud enviando o parametro codigo 
        por GET.1
    -->
    <h1>Lista de Produtos</h1>
    <form method="post" action="ExPw10_lista.php">
        <input type="text" id="busca" name="busca" />
        <button name="bt1">ok</button>
    </form>
    <table border="1" width="100%">
    <tr><td><b>Codigo</b></td>
        <td><b>titulo</b></td>
        <td><b>valor</b></td>
        <td><b>descritivo</b></td>
        <td><b>qtd</b></td>
        <td><b>categoria</b></td>
        <td>&nbsp;</td></tr>
    <?php  listar(); ?>
    </table>
    </body>
</html>
<?php 
function listar(){
    $conexao = new mysqli("localhost","root","123456",
    "pwebt");
    if(isset($_POST["bt1"])){
        $busca = $_POST["busca"];
        $sql = "select * from produto where titulo 
            like '%$busca%' order by titulo";
    } else {
        $sql = "select * from produto order by titulo";
    }
    $resultado = mysqli_query($conexao, $sql);
    while($reg = mysqli_fetch_array($resultado)){
        $codigo = $reg["codigo"];
        $titulo = $reg["titulo"];
        $valor = $reg["valor"];
        $descritivo = $reg["descritivo"];
        $qtd = $reg["qtd"];
        $categoria = $reg["categoria"];
        echo "<tr><td>$codigo</td><td>$titulo</td>
            <td>$valor</td><td>$descritivo</td>
            <td>$qtd</td><td>$categoria</td>
            <td><a href='ExPw09_crud.php?codigo=$codigo'>
            editar</a></td>
            </tr>";
    }
    mysqli_close($conexao);
}
?>