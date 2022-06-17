/*
Escreva uma classe de teste para testar todos os métodos da sua calculadora
científica.
*/
public class TesteCalculadoraCientifica {
    public static void main(String[] args) {
        CalculadoraCientifica calculadora = new CalculadoraCientifica();
        System.out.println(calculadora.raiz(12));
        System.out.println(calculadora.raiz(30.0f));
        System.out.println(calculadora.raiz("123"));
        System.out.println(calculadora.potencia(6, 3));
        System.out.println(calculadora.potencia("3", "6"));
        System.out.println(calculadora.potencia(5, 5.0f));        
    }
}
