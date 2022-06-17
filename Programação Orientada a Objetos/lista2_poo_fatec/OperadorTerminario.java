import javax.swing.JOptionPane;

public class OperadorTerminario {
    public static void main(String[] args) {
        byte nota = Byte.parseByte(
            JOptionPane.showInputDialog("Qual a nota")
        );
        JOptionPane.showMessageDialog(
            null,
            nota >=6 ? "Aprovado" : "Reprovado"
        );
    }
}
