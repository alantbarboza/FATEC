/* 
Ler um número inteiro e exibir se ele é positivo, negativo ou neutro (0).
*/
import java.util.*;
public class Ex1 {
    public static void main(String[] args) {
        Scanner leitor = new Scanner (System.in);
        System.out.println ("Digite um número: ");
        int numero = leitor.nextInt();

        if (numero > 0)
            System.out.println("O número é positivo");
        
        else if (numero == 0)
            System.out.println("O número é neutro");

        else
            System.out.println("O número é negativo ");

        leitor.close();       
    }
}
