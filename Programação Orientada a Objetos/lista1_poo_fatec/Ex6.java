/*
Ler a idade de uma pessoa expressa em anos e exibir expressa em dias (considere que
um ano tem 365 dias.
*/
import javax.swing.JOptionPane;
public class Ex6 {
    public static void main(String[] x) {
        Integer ano, dias;

        ano = Integer.parseInt(JOptionPane.showInputDialog("Digite os anos: "));
    
        dias = ano * 365;

        String resultado = String.format(       
            "O ano de %d corresponde a  %d dias", ano , dias
        );
        JOptionPane.showMessageDialog(null, resultado);
    }
}
