/*
3 Escreva uma hierarquia de classes para representar animais. Deve haver uma classe
Animal que define o nome e a quantidade de patas do animal. 
*/
package exercicio3e4;

public class Animal {
    String nome;
    Integer patas;

    //Ela deve ter três construtores: 
    
    //o padrão
    public Animal(){
        System.out.println("Construindo Animal...");
    }

    //um que recebe uma string a ser atribuída ao nome do animal 
    public Animal(String nome) {
        this.nome = nome;
    }
    //um terceiro que recebe o número de patas e o nome
    public Animal(String nome, int patas) {
        this.nome = nome;
        this.patas = patas;
    } 
}

