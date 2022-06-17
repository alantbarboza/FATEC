/*
Ler a cotação do dólar e a quantidade de dólares. Converter para real e mostrar o
resultado.
*/
import javax.swing.JOptionPane; 
public class Ex1 {
    public static void main(String[] x) {
        double dolar, conversao, cotacao;

        cotacao = Double.parseDouble(JOptionPane.showInputDialog("Digite a cotação do dolar:"));
        dolar = Double.parseDouble(JOptionPane.showInputDialog("Digite a quantia em dólar:"));
    
        conversao = dolar * cotacao;

        String real = String.format(       
            "Resultado: dolar: %.2f   EQUIVALE A   real: %.2f", dolar , conversao
        );
        JOptionPane.showMessageDialog(null, real);
    }
}