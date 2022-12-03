import { Component, OnInit, SimpleChanges } from '@angular/core';
import { PrevisoesService } from '../previsoes.service';
import { Previsao } from '../previsao';

@Component({
  selector: 'app-previsoes',
  templateUrl: './previsoes.component.html',
  styleUrls: ['./previsoes.component.css']
})

export class PrevisoesComponent implements OnInit {

  historico_previsoes:any //Usada para guardar a lista de previsões vinda do banco de dados
  minha_previsao:Previsao //Objeto que usamos para guardar e exibir as informações da previsão para o usuário
  cidade:string; //Guardamos a cidade pesquisada pelo usuário
  data_previsao:string //Guarda a data atual convertida em string
  link_previsao:string// Guarda o link contendo o icone da previsao

  //Passamos por parametro do tipo Previsões services, assim podemos usar as funçoes declaradas em PrevisõeService.ts
  //Se torna uma propriedade do componente por causa do modificador private
  constructor(private previsoesService:PrevisoesService) {
   }

  ngOnInit(): void {

    //
    this.previsoesService
    .registrarComp().subscribe(previsoes => {
      console.log('estamos no componente', previsoes)
    })

    //Chamamos o atualizar assim que o componente 'carregar' para listar o histórico de previsões do banco de dados
    this.atualizar()
  }


  //Quando o usuário digitar a cidade deseja no input e apertar o botao de pesquisa, enviamos uma requisição para api
  pesquisar():void{

    //Se o usuario digitar alguma coisa no input validamos o if
    //Caso contrario, o campo estaja vazio o else será chamado, trazendo um alert para o usuário digitar alguma coisa.
    if(this.cidade){
      //Através de previsõesService chamamos obterPrevisões passando como parametro a cidade
      this.previsoesService.obterPrevisoes(this.cidade);

      //Após a requisição usamos o registrarComp para pegar a resposta da api
      //Como se trata de um método assincrono e retorna um observable, precisamos invocar o método subscribe para pegar a resposta
      //Passamos uma função anonima com um parametro do tipo any(pois não sabemos de que tipo é a resposta, evitamos complicações)
      this.previsoesService.registrarComp()
        .subscribe((previsoes:any) =>{

      //Inicializamos o objeto do tipo previsão para guardar os dados desejado
      //Nome da cidade, previsão atual, minima e maxima, o endereço do icone e a data atual
      this.minha_previsao = new Previsao()  
      
      this.minha_previsao.name_city = previsoes.city.name;
      this.minha_previsao.temp = previsoes.list[0].main.temp
      this.minha_previsao.minTemp =previsoes.list[0].main.temp_min;
      this.minha_previsao.maxTemp = previsoes.list[0].main.temp_max;
      this.minha_previsao.icon = `http://openweathermap.org/img/wn/${previsoes['list'][0]['weather'][0]['icon']}@2x.png`;
      this.minha_previsao.data_previsao = new Date(Date.now()).toISOString();
    
      })
    }
    else{
      
      alert('Digite alguma coisa')
    }
    
  }


  //Usado quando o usuário deseja manter a previsoa no histórico
  adicionar(){
    this.data_previsao = this.minha_previsao.data_previsao;
    this.link_previsao = this.minha_previsao.icon;
    this.previsoesService.enviarPrevisao(this.cidade, this.data_previsao, this.link_previsao)
    }

  //Obtem o historico do banco de dados
  //Usado quando o componente 'nasce' ou quando queremos 'atualizar as requisições existente no banco de dado'
  //O usuario aperta o botao atualiza chamando esse método novamente com as novas previsões registradas
  //Quando chamamos o método subscribe, passamos uma função anomima onde pegamos a respota dentro do Objeto vindo do banco de dados
  //acessando a propriedade items(essa proprieade é uma lista/array contendo nossas requisições) 
  //do obejto guardado-a em nossa variavel historico previsoes
  atualizar(){ 
    this.previsoesService.historicoPrevisoes()
        .subscribe((resp:any)=> {
          this.historico_previsoes = resp.items
        })
    }
  }

