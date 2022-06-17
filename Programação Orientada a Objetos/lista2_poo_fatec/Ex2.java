/* 
Ler coeficientes reais a, b e c de uma equação de segundo grau e exibir a(s) raiz(es),
caso exista(m). Lembretes: Calcule o valor de delta. Se ele for negativo, não há
raízes. Se for igual a zero, há uma única raiz. Se delta for maior do que zero, então
há duas raízes.
*/
import java.util.*;

public class Ex2 {
    public static void main(String[] args) {
        int a , b , c , delta;
        double x1, x2;

        Scanner leitor = new Scanner (System.in);
        System.out.println ("Digite o coeficiente real A: ");
        a = leitor.nextInt();
        System.out.println ("Digite o coeficiente real B: ");   
        b = leitor.nextInt();
        System.out.println ("Digite o coeficiente real C: ");
        c = leitor.nextInt();

        //delta = b^2 - 4.a.c
        delta = (b * b) - (4 * a * c);

        x1 = (-b+Math.sqrt(delta))/(2*a);

        if (delta > 0){
            x2 = (-b-Math.sqrt(delta))/(2*a);
            System.out.printf("As raizes reais são %.2f e %.2f", x1, x2);

        }else if (delta == 0)
            System.out.printf("A raiz real é %.2f", x1);

        else
            System.out.println("Nao existem raizes reais ");


        leitor.close();       
    }
}
