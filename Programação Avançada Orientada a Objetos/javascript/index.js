//esse é um comentário em Javascript (de uma única linha)
/*
Esse é um comentário
de múltiplas linhas
*/ 

/*
const nome = "Jose";   //constante
let a = 2;             //variavel(recomendavel usar ela)
var idade = 18         //variavel
console.log(`Olá, ${nome}`)

if (idade >= 18){
  let nome = 'Maria'
  console.log (`Parabéns, ${nome}. Você já pode dirigir`)
}
console.log(`Até mais, ${nome}`)

Tipos:
    Primitivos:
        -> boolean
        -> null
        -> number
        -> string
        -> undefined
    Objetos:
        -> JSON
        -> Array
        -> Classes Wrapper (String, Number, Boolean)
        -> Date
        -> Math
        -> Funções

Comparação:
    === igual  //compara por tipo e depois por valor. Se os tipos forem diferentes, 
                ele já resulta em false. Caso contrário, compara os valores.
                (recomendavel usar ele).

    ==  igual //compara por valor. Se os tipos forem diferentes, faz coerção implícita.
    != diferente
    
Coerção:
    const n1 = 2;
    const n2 = '3';

    //coerção implícita de n1, concatenação acontece
    const n3 = n1 + n2;
    console.log(n3);

    //coeração explícita, soma acontece
    const n4 = n1 + Number (n2)
    console.log(n4)

Vetores:
    v2 = [2, 'abc', true, [1, 2, 3]]
    const nomes = ['Ana Maria', "Antonio", "Rodrigo", "Alex", "Cristina"]
    
    for (let i = 0; i < v2.length; i++){ //ver o que tem dentro do vetor
      console.log(v2[i])
    }

    //declaração
    v1 = []
    console.log(v1.length) //ver o tamanho do vetor
    v1[0] = 3.4 //v1[0] recebe o valor 3.4

Functions:
    function hello (nome = 'João'){  //caso não passar nenhum valor, o parametro nome
      console.log(`Oi, ${nome}`)     //receberá o valor de 'João'
    }

    hello('Pedro')

    int soma (int a, int b){
      return a + b;
    }

Arrow functions:
    const dobro = (valor) => valor * 2  //se a arrow function tiver apenas uma linha, poderá
                                        //tirar as () e {}.

    const dobro = (valor) => { return valor * 2 }  
    console.log(dobro(1))

    Filter: retorne apenas os nomes que começam com A:
        const apenasComA = nomes.filter((n) => {return n.startsWith("A")})
        console.log(apenasComA)

        //ou

        const todosComecamComA = nomes.every((nome) => {return nome.startsWith('A')})
        console.log(todosComecamComA)

    Map: vetor que contenha a primeira letra de cada nome:
        const primeirasLetras = nomes.map((nome) => {return nome.charAt(0)})
        console.log(primeirasLetras)


    Reduce:
        const valores = [1, 2, 3, 4]
        const soma = valores.reduce((ac, v) => {return ac + v})
        console.log(soma)

//calculadora que faz operações de soma e subtração envolvendo dois operandos:
    let calculadora = { //objeto
      soma: (a , b) => a + b, //arrow function
      subtracao: function (a,b){ //function
        return a - b
      }
    }

    const res = calculadora.soma(3,3)   //1* maneira: chamando o atributo soma do objeto calculadora
    const outroRes = calculadora['subtracao'](5,2)  //2* maneira: chamando o atributo subtracao do objeto calculadora

    console.log(`Soma: ${res}, Subtração: ${outroRes}`)

setTIMEout:
    setTimeout(() => {  //assim que acabar o programa principal, a setTIMEout irá executar após
      console.log('Dentro da timeout', 500)  //  <----- esse tempo
    }

FS - File System:    Abrindo/Lendo um arquivo
    const fs = require ('fs')   //require é como se fosse um import
    const abrirArquivo = (nomeArquivo) => {
      //função callback: ela não é chamada explicitamente por você.
      //é chamada automaticamente pelo programa
      const exibirConteudo = function (erro, conteudo){
        if (erro)
          console.log (`Erro: ${erro}`)
        else{
          const res = +conteudo.toString() * 2
          const finalizar = function (erro){
            if (erro)
              console.log(`Erro: ${erro}`)
            else
              console.log('Conteúdo armazenado com sucesso')
          }
          fs.writeFile('dobro.txt', res.toString(), finalizar)
        }
      }
      fs.readFile(nomeArquivo, exibirConteudo)
    }
    abrirArquivo('arquivo.txt')

Promises:   um objeto por meio do qual uma função 
            pode propagar um resultado ou um erro em algum momento no futuro.
                      Fulfilled <-- Pending --> Rejected

    //adaptar a função anterior para que ela verifique se o numero é maior do que zero.
    //Se for, ela continua operando como agora. Senão, ela devolve uma promise rejected
    //com a mensagem de erro " não use números negativos, por favor"
    function calculoRapidinho(numero) {
      //operador ternario
      return numero >= 1        
      ? Promise.resolve((numero * (numero + 1)) / 2)
      : Promise.reject("Somente valores positivos, por favor");
      }
    calculoRapidinho(10).then(x => console.log(x))
    calculoRapidinho(-2)
    .then(x => console.log(x))
    .catch(x => console.log(x))
*/


function calculoDemorado(numero){
  const p = new Promise(function(resolve, reject){
    let res = 0
    for (let i = 1; i <= numero; i++)
      res += i
    resolve(res)
  })
  return p
}


const res = calculadoDemorado(10)
//blocos then e catch
res.then(x => console.log(x))


function calculoRapidinho (numero){  //metodo 1
  return Promise.resolve((numero * (numero + 1)) / 2)
}

function calculoRapidinho (numero){  //metodo 2
  return new Promise((resolve, reject) =>{
    resolve((numero * (numero + 1)) / 2)
  })
}

