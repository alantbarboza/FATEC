<!doctype html>
<html>
    <body>
    <h1>Lista de clientes</h1>
    <form method="post" action="listaCliente.php">
    <input type="text" id="busca" name="busca" />
    <button name="bt1">ok</button>
    </form>
    <table border="1" width="100%">
    <tr><td><b>Codigo</b></td>
        <td><b>nome</b></td>
        <td><b>email</b></td>
        <td><b>telefone</b></td>
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
        $sql = "select * from cliente where nome 
            like '%$busca%' order by nome";
    } else {
        $sql = "select * from cliente order by nome";
    }
    $resultado = mysqli_query($conexao, $sql);
    while($reg = mysqli_fetch_array($resultado)){
        $codigo = $reg["codigo"];
        $nome = $reg["nome"];
        $email = $reg["email"];
        $telefone = $reg["telefone"];
        echo "<tr><td>$codigo</td><td>$nome</td>
            <td>$email</td><td>$telefone</td>
            <td><a href='cliente.php?codigo=$codigo'>
            editar</a></td>
            </tr>";
    }
    mysqli_close($conexao);
}
?>