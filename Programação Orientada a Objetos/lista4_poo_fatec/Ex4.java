/*
Note que a classe de teste deixou de funcionar após a adição do construtor. Faça os
ajustes necessários para que ela volte a funcionar.
*/

public class Ex4 {

    public static void main(String[] args) {
        //Instância dois veículos
        Ex3 carro1 = new Ex3("Cinza","Ford");
        Ex3 carro2 = new Ex3("Preto","Fiat");

        carro1.exibirMensagem();
        carro1.abrirPorta();  //chamando metodo/função abrirPorta()

        carro2.exibirMensagem();  
        carro2.fecharPorta();


        //Exibe os valores das variáveis usando os métodos getters
        carro1.getCor();
        carro1.getFabricante();

        carro2.getCor();
        carro2.getFabricante();
    }
}
