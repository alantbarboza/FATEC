/*
- Linguagem interpretada e executada na máquina do cliente

*/

function media(){
    //parseFloat: converte para FLOAT
    var a = parseFloat(n1.value); //valor digitado na caixa com ID n1
    var b = parseFloat(n2.value);
    var nome = "maria";
    var c = (a+b)/2;
    res.value = c;
}

//expressão regular
var regNome = new RegExp("[A-z ]{6,100}");
var regSenha = new RegExp("^(?=.*[A-Z])(?=.*[!#@$%&])(?=.*[0-9])(?=.*[a-z]).{6,25}$");
var regTel = new RegExp("[0-9]{4,5}-[0-9]{4}]");
var regDeny = new RegExp("or 1=1|location.href|<script"); //bloqueando um javascript injection 
var tudoOk = true;
function validar(){
    nome.classList.remove("erro"); //remover a CLASSE ERRO do campo nome  
    senha.classList.remove("erro");
    erros.innerHTML = ""; //mudar um conteudo HTML com o ID

    if(!regNome.test(nome.value)){
        erros.innerHTML = erros.innerHTML + "Informe um nome completo !<br/>"; //conteudo atual e adicione a mensagem informe...
        nome.classList.add("erro"); //adicionar a CLASSE ERRO do campo nome  
        nome.focus; //posicionando o cursor no campo
        tudoOk = false; //interrompe a execução do script
    }
    if(!regSenha.test(senha.value)){
        erros.innerHTML = erros.innerHTML +  "Informe uma senha forte !<br/>";
        senha.classList.add("erro");
        senha.focus(); 
        tudoOk = false;      
    }
    if(!regTel.test(telefone.value)){
        erros.innerHTML = erros.innerHTML + "Informe um telefone valido !<br/>";
        telefone.focus();
        tudoOk = false;
    }
    if(regDeny.test(msg.value)){
        msg.value = "Conteudo improprio !";
        tudoOk = false;
    }
    if(tudoOk) alert("tudo certo !");
}
