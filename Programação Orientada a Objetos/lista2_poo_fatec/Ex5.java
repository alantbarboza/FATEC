/* 
Ler um número inteiro no intervalo [1, 12]. Considerando que cada número
representa um mês da seguinte forma: 1: Janeiro, 2: Fevereiro e assim por diante,
exiba o número de dias que o mês cujo respectivo número digitado possui.
*/
import java.util.*;
public class Ex5 {
    public static void main(String[] args) {
        Scanner leitor = new Scanner (System.in);
        System.out.println ("Digite um número entre 1 e 12:  ");
        int mes = leitor.nextInt();

        switch (mes) {
            case 1:
                System.out.println ("JANEIRO TEM 31 DIAS");
                break;
            case 2:
                System.out.println ("FEVEREIRO TEM 28 DIAS");
                break;
            case 3:
                System.out.println ("MARÇO TEM 31 DIAS");
                break;
            case 4:
                System.out.println ("ABRIL TEM 30 DIAS");
                break;
            case 5:
                System.out.println ("MAIO TEM 31 DIAS");
                break;
            case 6:
                System.out.println ("JUNHO TEM 30 DIAS");
                break;
            case 7:
                System.out.println ("JULHO TEM 31 DIAS");
                break;
            case 8:
                System.out.println ("AGOSTO TEM 31 DIAS");
                break;
            case 9:
                System.out.println ("SETEMBRO TEM 30 DIAS");
                break;
            case 10:
                System.out.println ("OUTUBRO TEM 31 DIAS");
                break;
            case 11:
                System.out.println ("NOVEMBRO TEM 30 DIAS");
                break;
            case 12:
                System.out.println ("DEZEMBRO TEM 31 DIAS");
                break;
            default:
                System.out.println ("DIGITE APENAS NÚMEROS ENTRE 1 E 12");
        }
            
        leitor.close();       
    }
}
