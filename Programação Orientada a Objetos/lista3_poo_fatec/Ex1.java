/* 
Escreva um programa que exibe os primeiros 100 números naturais. Faça versões
usando for, while e do/while.
*/
public class Ex1 {
    public static void main(String[] args) {
        System.out.println ("os primeiros 100 números naturais:");

        System.out.printf ("FOR: ");
        for (int contador = 1; contador <= 100 ; contador++ ){
            System.out.printf (" %d " , contador);
        }

        System.out.printf ("\nWHILE:");
        int contador = 1;
        while (contador <= 100){
            System.out.printf (" %d " , contador);
            contador++;
        }

        System.out.printf ("\nDO WHILE:");
        contador = 1;
        do{
            System.out.printf (" %d " , contador);
            contador++;
        }while (contador <= 100);

    }
}
