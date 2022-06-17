/*
Escreva uma classe de teste que:
2.1 Instancia dois veículos.  (instância é sinônimo de objeto)
2.2 Obtém valores para seus atributos e os atribui adequadamente.
2.3 Chama cada um dos métodos que você criou.
2.4 Exibe os valores das variáveis, usando os métodos getters
*/

import java.util.Scanner;

public class Ex2 {
    public static void main(String[] args) {
        //Instância dois veículos
        Ex1 carro1 = new Ex1();
        Ex1 carro2 = new Ex1();
        
        Scanner scanner = new Scanner(System.in);

        System.out.printf("Cor do carro 1: ");
        String cor = scanner.nextLine();   //ler dados (String) que foram digitados
        System.out.printf("Fabricante do carro 1: ");
        String fabricante = scanner.nextLine(); 
        carro1.setCor(cor);
        carro1.setFabricante(fabricante);                     

        System.out.printf("Cor do carro 2: ");
        String cor2 = scanner.nextLine();
        System.out.printf("Fabricante do carro 2: ");
        String fabricante2 = scanner.nextLine();
        carro2.setCor(cor2);
        carro2.setFabricante(fabricante2);

        carro1.exibirMensagem();
        carro1.abrirPorta();  //chamando metodo/função abrirPorta()

        carro2.exibirMensagem();  
        carro2.fecharPorta();


        //Exibe os valores das variáveis usando os métodos getters
        carro1.getCor();
        carro1.getFabricante();

        carro2.getCor();
        carro2.getFabricante();
        scanner.close();
    }

}
