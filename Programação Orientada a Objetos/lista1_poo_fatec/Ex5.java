/*
Ler as dimensões de um retângulo (base e altura), calcular e escrever a área do
retângulo.
*/
import javax.swing.JOptionPane;
public class Ex5 {
    public static void main(String[] x) {
        Integer base, altura, area;

        base = Integer.parseInt(JOptionPane.showInputDialog("Digite a base de um retângulo"));
        altura = Integer.parseInt(JOptionPane.showInputDialog("Digite a altura de um retângulo"));
    
        area = base * altura;

        String resultado = String.format(       
            "A área do retângulo é: %d", area
        );
        JOptionPane.showMessageDialog(null, resultado);
    }
}
