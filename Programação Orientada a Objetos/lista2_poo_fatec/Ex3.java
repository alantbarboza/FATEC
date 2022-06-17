/* 
Ler três valores reais e exibir o maior valor entre eles. Suponha que eles sejam
diferentes.
*/
import java.util.*;
public class Ex3 {
    public static void main(String[] args) {
        double n1, n2, n3;

        Scanner leitor = new Scanner (System.in);
        System.out.println ("Digite o primeiro número: ");
        n1 = leitor.nextDouble();
        System.out.println ("Digite o segundo número: ");   
        n2 = leitor.nextDouble();
        System.out.println ("Digite o terceiro número: ");
        n3 = leitor.nextDouble();

        if (n1 > n2 && n1 > n3)
            System.out.printf("O número maior é o %.2f", n1);
        
        else if (n2 > n1 && n2 > n3)
            System.out.printf("O número maior é o %.2f", n2);

        else
            System.out.printf("O número maior é o %.2f", n3);

        leitor.close();       
    }
}