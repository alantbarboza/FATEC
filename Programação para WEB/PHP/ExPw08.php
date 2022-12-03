<!doctype html>
<html>  <head><title>Exemplo PHP</title></head>
    <body>  
    <!-- Utitlizando o exemplo dado em aula, crie um formulário em PHP
         deverá contar com duas caixas de texto n1 e n2
         deverá contar com 5 botões (somar, multiplicar, subtrair, dividir,taboada)
         coletar os dados do formulário
         realizar a operação matemática especifica
         Criar uma função para cada operação -->
    <h1>Teste PHP</h1>
    <form method="post" action="ExPw08.php">
        n1:<input type="number" id="n1" name="n1" /><br/>
        n2:<input type="number" id="n2" name="n2" /><br/><br/>
        <button name="bt1">Somar</button>
        <button name="bt2">Multiplicar</button>
        <button name="bt3">Subtrair</button>
        <button name="bt4">Dividir</button>
        <button name="bt5">Taboada</button>
    </form>
    <?php 
        if(isset($_POST["bt1"])) Somar(); 
        if(isset($_POST["bt2"])) Multiplicar(); 
        if(isset($_POST["bt3"])) Subtrair(); 
        if(isset($_POST["bt4"])) Dividir(); 
        if(isset($_POST["bt5"])) Taboada(); 
    ?>
    </body></html>
<?php
function Somar(){
    $a = $_POST["n1"];
    $b = $_POST["n2"];
    $c = $a + $b;
    echo "<h3> Resultado da soma: $c </h3>";
}
function Multiplicar(){
    $a = $_POST["n1"];
    $b = $_POST["n2"];
    $c = $a * $b;
    echo "<h3> Resultado da multiplicação: $c </h3>";
}
function Subtrair(){
    $a = $_POST["n1"];
    $b = $_POST["n2"];
    $c = $a - $b;
    echo "<h3> Resultado da subtração: $c </h3>";
}
function Dividir(){
    $a = $_POST["n1"];
    $b = $_POST["n2"];
    $c = $a / $b;
    echo "<h3> Resultado da divisão: $c </h3>";
}
function Taboada(){
    $a = $_POST["n1"];
    $b = $_POST["n2"];
    echo "<h3> Taboada do $a: </h3>";
    for($i = 1; $i < 11; $i++){
        echo "</br> $a X $i = ".$a * $i;
    }
    echo "<h3> Taboada do $b: </h3>";
    for($i = 1; $i < 11; $i++){
        echo "</br> $b X $i = ".$b * $i;
    }
}
?>