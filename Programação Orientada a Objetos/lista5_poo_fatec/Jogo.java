/* 
1. Adicione um método à classe Personagem que exibe o estado (valores de energia,
fome e sono) dos objetos. Chame ele em cada método existente na sua classe. Ele
deve exibir o nome do personagem seguido dos valores de cada variável.

2. Adicione um novo personagem e inclua ele no “loop do jogo”.
*/ 

import java.util.Random;
public class Jogo {
    public static void main(String[] args) throws Exception {
        Personagem cacador = new Personagem (10, 0, 0);
        Personagem soneca  = new Personagem (2, 4, 10);
        
        cacador.setNome("Caçador");
        soneca.setNome("Soneca");
        Random gerador = new Random();

        while(true){
            //gera numeros aleatorios de = (numero 6 significa maximo 5) + 1 = [1,6] 
            int oQueFazer = gerador.nextInt(6) + 1; 
            

            switch(oQueFazer){
                case 1: 
                    cacador.cacar();
                    cacador.estado();
                    break;
                case 2: 
                    soneca.cacar();
                    soneca.estado();
                    break;
                case 3: 
                    cacador.comer();
                    cacador.estado();
                    break;
                case 4: 
                    soneca.comer();
                    soneca.estado();
                    break;
                case 5: 
                    cacador.dormir();
                    cacador.estado();
                    break;
                case 6: 
                    soneca.dormir();
                    soneca.estado();
                    break;
            }
            System.out.println("\n=========================");
            Thread.sleep(2000); //espera 2 segundos
        }
    }           
}