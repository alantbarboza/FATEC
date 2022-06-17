import java.util.Random;

public class ExemploDoWhile {
    public static void main(String[] args) {
        Random gerador = new Random();
        double nota1, nota2;
        do{
            nota1 = gerador.nextDouble() * 10; //numero aleatorio de 0.00 a 10.00
            nota2 = gerador.nextDouble() * 10; 

        }while (nota1 < 0 || nota1 > 10 || nota2 < 0 || nota2 > 10);
        System.out.println ((nota1 + nota2) / 2);    
    }
}
