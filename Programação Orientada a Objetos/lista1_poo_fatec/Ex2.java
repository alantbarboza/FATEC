/* 
Ler 4 números, calcular o quadrado para cada um, somar todos os quadrados e mostrar o
resultado.
*/
import javax.swing.JOptionPane; 
public class Ex2 {
    public static void main(String[] x) {
        Integer n1, n2 , n3 , n4 , quadrado;

        n1 = Integer.parseInt(JOptionPane.showInputDialog("Digite o primeiro numero:"));
        n2 = Integer.parseInt(JOptionPane.showInputDialog("Digite o segundo numero:"));
        n3 = Integer.parseInt(JOptionPane.showInputDialog("Digite o terceiro numero:"));
        n4 = Integer.parseInt(JOptionPane.showInputDialog("Digite o quarto numero:"));

        quadrado = (n1*n1) + (n2*n2) + (n3*n3) + (n4*n4);
        
        String res = String.format(
            "Resultado: %d", quadrado
        );
        JOptionPane.showMessageDialog(null, res);  
    }
}
