/*
Escreva uma classe chamada CalculadoraCientifica. Ela deve fazer as operações de
potenciação e radiciação com inteiros e reais.
*/

public class CalculadoraCientifica {
    /*Escreva um método chamado raiz. Utilizando sobrecarga de métodos, ele terá três
      versões:*/
    // Lista de parâmetros com um inteiro
    public double raiz(int a){
        return Math.sqrt(a);
    }
    // Lista de parâmetros com um double
    public double raiz(double a){
        return Math.sqrt(a);

    }
    /* Lista de parâmetros com uma String (internamente, ele converte a String para
       Double com Double.parseDouble antes de fazer a operação). */
    public double raiz(String a){
        return Math.sqrt(Double.parseDouble(a));
    }

    /*Escreva um método chamado potência. Utilizando a sobrecarga de métodos, ele
      terá três versões:*/
    // Lista de parâmetros com dois bytes a e b. Ele calcula e devolve a elevado a b.
    public double potencia(int a, int b){
        return Math.pow(a, b);
    }
    /* Lista de parâmetros com duas Strings s1 e s2. Ele converte ambas para double,
       calcula e devolve s1 elevado a s2. */
    public double potencia(String s1, String s2){
        return Math.pow(Double.parseDouble(s1), Double.parseDouble(s2));
    }
    /*  Lista de parâmetros com um inteiro a e um double b. Ele calcula e devolve a
        elevado a b. */
    public double potencia (int a, double b){
        return Math.pow(a, b);
    }
}