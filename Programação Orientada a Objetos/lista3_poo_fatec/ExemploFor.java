import java.util.Scanner;

public class ExemploFor {
    public static void main(String[] args) {
        Scanner scanner = new Scanner (System.in);
        
        int contador = 1;
        while (contador <= 10){
            double nota1 = scanner.nextDouble();
            double nota2 = scanner.nextDouble();
            System.out.printf ("Média: %.2f\n", (nota1 + nota2)/2);
            contador++;
        }
    /*   
        //todos os campos no FOR são opcionais
        int contador = 1;
        for( ; contador <= 10; contador++){

        }
         
        int contador2 = 1;
        for( ; contador2 <= 10; ){
            System.out.println(contador2);

            if (contador2 > 10){
                break; //para o for
                continue; //for continua, e tudo que está abaixo do CONTINUE não é executado 
            }
            contador2++;
        }

        int contador3 = 1;
        for ( ; ; ){
            System.out.println(contador3++);
            if (contador3 > 10)
                break;

        }
    */
        scanner.close();
    }
}
