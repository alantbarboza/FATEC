/*
Uma revendedora de carros usados paga a seus funcionários vendedores um salário
fixo por mês, mais uma comissão também fixa para cada carro vendido e mais 5% do valor
das vendas por ele efetuadas. Ler o número de carros por ele vendidos, o valor total de
suas vendas, o salário fixo e o valor que ele recebe por carro vendido. Calcular e exibir o
salário final do vendedor.
*/
import javax.swing.JOptionPane;
public class Ex11 {
    public static void main(String[] x) {
        Double salario , vendas , salarioFixo , comissao ;
        Integer carros;
        
        carros = Integer.parseInt(JOptionPane.showInputDialog("Digite o numero de carros vendidos: "));
        vendas = Double.parseDouble(JOptionPane.showInputDialog("Digite o valor total de suas vendas: "));
        salarioFixo = Double.parseDouble(JOptionPane.showInputDialog("Digite o salario fixo: "));
        comissao = Double.parseDouble(JOptionPane.showInputDialog("Digite o valor por carro vendido: "));

        salario = salarioFixo + (comissao * carros) + (vendas * 0.05);

        String resultado = String.format(       
            "O salário final do vendedor será: %.2f reais", salario
        );

        JOptionPane.showMessageDialog(null, resultado);  
    }
}
