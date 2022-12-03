import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  nome;
  esconderCaixa = true
  numero: number
  escolher(): void{
    this.numero = Math.floor(Math.random() * 100) + 1
  }

  alterarNome(nome){
    console.log(nome.target.value)
    this.nome = nome.target.value
  }
  
  lancarDado(){
    return Math.floor(Math.random() * 6) + 1
  }
  
  adicionar(nomeInput){
    this.nome = nomeInput.value
    this.esconderCaixa = nomeInput.value.length <= 0
  }
  // idade = 20
}
