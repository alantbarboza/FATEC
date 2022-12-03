import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { catchError, Observable, Subject } from 'rxjs';


@Injectable({
  providedIn: 'root'
})
export class PrevisoesService {
  //Observable que permite que os valores sejam multicast para muitos Observers.
  private previsoesSubject = new Subject();

  //Chave para acessar a api weather
  private appid: string = '39f24e48312f0c4e95891ff792b29c36';

  //Url para acessar o banco de dados
  private urlBd: string = 'https://gf12ad2ec957d47-databasep2previsoes.adb.sa-saopaulo-1.oraclecloudapps.com/ords/admin/tb_previsoes/'
 
  //Declaração do parametro do tipo HttpClient usando o modificador private
  //O private permite que seja uma propriedade do componente
  //Permitindo seu uso
  constructor(private httpClient: HttpClient) { }

  //Essa função faz a requisição a API Weather
  //Retornando como resposta um Objeto contendo a uma lista com a previsao do tempo atual e dos próximos 5 dias
  //Passamos como parametro a cidade que desejamos buscar a previsão do tempo
  //Seu retorno é void
  obterPrevisoes(cidade: string): void {
    //Solicitamos uma requisição do tipo Get para buscas os dados da api
    //Na url passamos a cidade que desejamos, a chave de acesso e a unidade de medida(por padrão retorna em ºF ou ºK)
    /*
    o método get é assíncrono e retorna um Observable. Sendo assim, para recuperarmos seu resultado precisamos invocar o 
    método subscribe, passando para ele uma função anônima cujo argumento é o corpo da resposta obtido, já devidamente convertido para 
    objeto JavaScript.
    */
    this.httpClient.get(`https://api.openweathermap.org/data/2.5/forecast?q=${cidade},br&appid=${this.appid}&units=metric`)  
    .subscribe(response => {
        //Usando o Subject para chamar a função next(), você publica um valor para quem estiver ouvindo
          this.previsoesSubject.next(response);
    });
  };

  //Através da função asObservable 'ouvimos a publicação' e pegamos o valor da função acima
  //Retornando para quem quiser usar.
  registrarComp(){
    return this.previsoesSubject.asObservable();
  }

  //Enviamos nossa previsão para o banco de dados, assim mantemos um histórico das previsões consultadas
  //Passamos como parametro a cidade, a data que ocorreu a previsao e o link(este sendo o icone da previsão)
  enviarPrevisao(cidade:string, data:string, link:string){ 
    //Usando o httpClient o post, que vai enviar a previsão para o nosso banco de dados
    //O post recebe como parametro a url do banco de dados (urlBd) e um objeto contendo os parametros passado
    //Nosso subscribe apenas exibe o objeto enviado para o banco e exibe uma mensagem avisando que foi enviado
    this.httpClient.post(this.urlBd, {cidade:cidade, data_previsao:data, link_previsao:link})
    .subscribe(resp =>{
      console.log("Enviado")
      console.log(resp)
    } )
  }

  //Usamos o get para trazer a lista de historico das nossas requisições do nosso banco de dados e retornando-os
  historicoPrevisoes(){
    return this.httpClient.get(this.urlBd)
  }

  
}
