/*
Escreva duas classes chamadas Cachorro e Gato que herdam de Mamifero. Ambas
definem um único construtor que recebe o nome do Animal e repassa para a
superclasse. Internamente, ambos devem repassar o valor 4 como quantidade de patas.
*/
package exercicio3e4;

public class Gato extends Mamifero {
    public Gato(String nome, int patas) {
        super(nome, 4);  
    } 
}
