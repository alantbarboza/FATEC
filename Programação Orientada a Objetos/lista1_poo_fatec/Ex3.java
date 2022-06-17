/*
Calcular o pagamento de comissão de vendedores de peças, levando-se em
consideração que sua comissão será de 5% do total da venda e que você tem os seguintes
dados: preço unitário da peça e quantidade vendida.
*/
import javax.swing.JOptionPane;
public class Ex3 {
    public static void main(String[] x) {
        double preco , quantidade , comissao;

        preco = Double.parseDouble(JOptionPane.showInputDialog("Digite o preço unitário da peça:"));
        quantidade = Double.parseDouble(JOptionPane.showInputDialog("Digite a quantidade vendida:"));

        comissao = ((preco * quantidade) * 5) / 100;
        
        String resultado = String.format(       
            "A comissão será de %.2f reais", comissao
        );
        JOptionPane.showMessageDialog(null, resultado);  
    }
}
