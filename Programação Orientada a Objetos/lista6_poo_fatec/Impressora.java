/*
Escreva uma classe chamada Impressora. Essa classe tem como finalidade imprimir
conteúdos diversos na tela. Ela deve possuir diversos métodos chamados exibir. Eles
poderão coexistir graças ao mecanismo conhecido como SOBRECARGA DE MÉTODOS.
Escreva versões do método exibir que tenham as seguintes listas de parâmetros.
*/

public class Impressora {

    // um único float. 
    public void exibir(float a){
        System.out.println(a);
    }
    // dois floats.
    public void exibir(float a, float b){
        System.out.println(a + "," + b);
    }
    // um float e uma String, nessa ordem
    public void exibir(float a, String b){
        System.out.println(a + "," + b);
    }
    // uma String e um float, nessa ordem.
    public void exibir(String a, float b){
        System.out.println(a + "," + b);
    }
    // três Strings.
    public void exibir(String a, String b, String c){
        System.out.println(a + "," + b + "," + c);
    }
    //  dois ints e uma String, nessa ordem.
    public void exibir(int a, int b, String c){
        System.out.println(a + "," + b + "," + c);
    }

}
