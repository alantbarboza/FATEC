/*
Ler a idade de uma pessoa expressa em anos, meses e dias e exibir a idade dessa
pessoa expressa apenas em dias. Considerar ano com 365 dias e mês com 30 dias.
*/
import javax.swing.JOptionPane;
public class Ex7 {
    public static void main(String[] x) {
        Integer anos, meses, dias, TotalDias;

        anos = Integer.parseInt(JOptionPane.showInputDialog("Digite os anos: "));
        meses = Integer.parseInt(JOptionPane.showInputDialog("Digite os meses: "));
        dias =  Integer.parseInt(JOptionPane.showInputDialog("Digite os dias: "));

        TotalDias = anos * 365 + meses * 30 + dias;

        String resultado = String.format(       
            "Idade expressa em dias: %d dias", TotalDias
        );
        JOptionPane.showMessageDialog(null, resultado);
    }
}
