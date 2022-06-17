/*
Reimplemente o exercício 1, fazendo com que os valores sejam exibidos em ordem
reversa
*/
public class Ex2 {
    public static void main(String[] args) {
        System.out.println ("os primeiros 100 números naturais:");

        System.out.printf ("FOR: ");
        for (int contador = 100; contador >= 1 ; contador-- ){
            System.out.printf (" %d " , contador);
        }

        System.out.printf ("\nWHILE:");
        int contador = 100;
        while (contador >= 1){
            System.out.printf (" %d " , contador);
            contador--;
        }

        System.out.printf ("\nDO WHILE:");
        contador = 100;
        do{
            System.out.printf (" %d " , contador);
            contador--;
        }while (contador >= 1);        
    }
}
