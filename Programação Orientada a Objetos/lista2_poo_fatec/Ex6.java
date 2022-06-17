/* 
 Ler um número inteiro e responder se ele é bissexto ou não. Um ano bissexto tem as
seguintes características:
- é múltiplo de quatro e não é múltiplo de 100 ou
- é múltiplo de 400
*/
import java.util.*;
public class Ex6 {
    public static void main(String[] args) {
        Scanner leitor = new Scanner (System.in);
        System.out.println ("Digite um ano: ");
        int ano = leitor.nextInt();

        if( (ano % 4 == 0) && (ano % 100 != 0)  ||  (ano % 400 == 0) )
            System.out.println("O ano " + ano +" é bissexto");
        
        else
            System.out.println("O ano " + ano +" NÃO É bissexto");

        leitor.close();       
    }
}