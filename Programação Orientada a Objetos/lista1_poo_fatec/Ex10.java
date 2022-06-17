/*
O custo de um carro novo ao consumidor é a soma do custo de fábrica com a
porcentagem do distribuidor e dos impostos (aplicados ao custo de fábrica). Supondo que o
percentual do distribuidor seja de 28% e os impostos de 45%, ler o custo de fábrica de um
carro, calcular e escrever o custo final ao consumidor.
*/
import javax.swing.JOptionPane;
public class Ex10 {
    public static void main(String[] x) {
        Double custoFabrica , custoConsumidor, porcentagemDistribuidor = 28.0,
        PercentualImpostos = 45.0, Destribuidor, ValorImpostos;

        custoFabrica = Double.parseDouble(JOptionPane.showInputDialog("Informe o custo de fábrica: "));
        Destribuidor = (custoFabrica * porcentagemDistribuidor) / 100.000;
        ValorImpostos = (custoFabrica * PercentualImpostos) / 100;
        custoConsumidor = Destribuidor + ValorImpostos;
        
        String resultado = String.format(       
            "O custo final ao consumidor será: %.2f reais", custoConsumidor
        );

        JOptionPane.showMessageDialog(null, resultado);  
    }
}
