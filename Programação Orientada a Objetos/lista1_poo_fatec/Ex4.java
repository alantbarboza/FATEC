/*
Ler um valor inteiro e exibir seu antecessor.
*/
import javax.swing.JOptionPane;
public class Ex4 {
    public static void main(String[] x) {
        Integer numero , antecessor;

        numero = Integer.parseInt(JOptionPane.showInputDialog("Digite um numero:"));
        
        antecessor = numero - 1;
        
        String resultado = String.format(       
            "O antecessor de %d é %d", numero , antecessor
        );
        JOptionPane.showMessageDialog(null, resultado);  
    }
}