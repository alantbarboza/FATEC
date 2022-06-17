/*
Escreva uma classe chamada Mamifero que herda de Animal. 
Ela deve ter um construtor somente. Ele recebe o nome e 
a quantidade de patas do Animal e os repassa para o construtor da superclasse.
*/
package exercicio3e4;

public class Mamifero extends Animal{
    public Mamifero(String nome, int patas){
        super(nome, patas);
    }
}
