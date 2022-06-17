/* 
Ler um inteiro no intervalo [1, 7] e exibir o dia da semana associado a ele, como a
seguir: 1: Domingo, 2: Segunda, 3: Terça. E assim por diante.
*/
import java.util.*;
public class Ex4 {
    public static void main(String[] args) {
        Scanner leitor = new Scanner (System.in);
        System.out.println ("Digite um número entre 1 e 7:  ");
        int dia = leitor.nextInt();

        switch (dia) {
            case 1:
                System.out.println ("DIA DA SEMANA:  DOMINGO ");
                break;
            case 2:
                System.out.println ("DIA DA SEMANA:  SEGUNDA-FEIRA ");
                break;
            case 3:
                System.out.println ("DIA DA SEMANA:  TERÇA-FEIRA ");
                break;
            case 4:
                System.out.println ("DIA DA SEMANA:  QUARTA-FEIRA ");
                break;
            case 5:
                System.out.println ("DIA DA SEMANA:  QUINTA-FEIRA ");
                break;
            case 6:
                System.out.println ("DIA DA SEMANA:  SEXTA-FEIRA ");
                break;
            case 7:
                System.out.println ("DIA DA SEMANA:  SABADO ");
            default:
                System.out.println ("DIGITE APENAS NÚMEROS ENTRE 1 E 7");
        }
            
        leitor.close();       
    }
}