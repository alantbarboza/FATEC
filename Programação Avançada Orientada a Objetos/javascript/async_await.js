function fatorial (n){
    if (n < 0)
      return Promise.reject('Valor não pode ser negativo')
    let res = 1
    for (let i = 2; i <= n; i++) res *= i
    return Promise.resolve(res)
  }
  
  function chamadaComThenCatch(){
    fatorial(5)
    .then(res => console.log(res))
    .catch(err => console.log(err))
  
    fatorial(-1)
    .then(res => console.log(res))
    .catch(err => console.log(err))
  }
  // chamadaComThenCatch()

async function chamadaComAsyncAwait(){
    try{
      const res = await fatorial(5)
      console.log(res)
      console.log("Antes do res2")
      const res2 = await fatorial(-1)
      console.log(res2)
      console.log("Depois do res2")
    }
    catch (err){
      console.log("Dentro do catch")
      console.log(err)
    }
  }
chamadaComAsyncAwait()

/* ASYNC  - a função deixa de devolver o resultado. 
          - cria uma promise que dará o resultado(Hello, ${nome}).

    async function hello(nome){
        return `Hello, ${nome}`
    }

    const res = hello('João')
    res.then(x => console.log(x))
*/