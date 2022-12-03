<html> <body>
    <?php lerDados(); ?>
    <?php include 'rodape.php'; ?>
    </body></html>
<?php
function lerDados(){
    if(isset($_GET["nome"])){
        $nome  = $_GET["nome"];
        $idade  = $_GET["idade"];
        $tel  = $_GET["tel"];
        echo "<b>Nome</b>:$nome<br/>";
        echo "<b>Idade</b>:$idade<br/>";
        echo "<b>Tel</b>:$tel<br/>";
    } else {
        echo "<h1>Dados invalidos</h1>";
    }
}
?>