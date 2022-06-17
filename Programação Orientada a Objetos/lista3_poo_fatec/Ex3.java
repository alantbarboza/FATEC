/*
Escreva um programa que calcula o fatorial de um valor natural digitado pelo
usuário.
*/
import java.util.*;
public class Ex3 {
    public static void main(String[] args) {
      
      int numero, contador, fatorial;

      Scanner leitor = new Scanner (System.in);
      System.out.printf ("Digite um número para calcular o seu fatorial: ");
      numero = leitor.nextInt();
      contador = numero;
      fatorial = 1;
      System.out.printf ("[%d!] ", numero);

      while (contador > 0){
        System.out.printf (" %d ", contador);
        System.out.printf (contador > 1 ? " X " : " = ");
        fatorial *= contador;
        contador -= 1;
      }
      System.out.printf (" %d ", fatorial);

      leitor.close();      
    }
}
