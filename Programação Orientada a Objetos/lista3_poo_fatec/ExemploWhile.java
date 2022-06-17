import java.util.Scanner;
public class ExemploWhile{
    public static void main(String[] args) {
        Scanner leitor = new Scanner (System.in);
        //repetição controlada por contador
        int contador;
        contador = 1;
        while (contador <= 10){
            System.out.println ("Digite a primeira nota");
            double nota1 = leitor.nextDouble();
            System.out.println ("Digite a segunda nota");
            double nota2 = leitor.nextDouble();
            double media = nota1 + nota2 / 2;
            System.out.printf("Média: %.2f\n", media);
            //contador = contador + 1;
            //contador += 1;
            //contador++;
            ++contador;
        }
        leitor.close();
    }

}