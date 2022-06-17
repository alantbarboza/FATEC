/*
Ler o salário mensal atual de um funcionário e o percentual de reajuste. Calcular e exibir
o valor do novo salário
*/
import javax.swing.JOptionPane;
public class Ex9 {
    public static void main(String[] x) {
        Double salario, reajuste, desconto, novoSalario;

        salario = Double.parseDouble(JOptionPane.showInputDialog("Digite o salário mensal atual: "));
        reajuste = Double.parseDouble(JOptionPane.showInputDialog("Digite o percentual de reajuste: "));
        
        desconto = (reajuste * salario) / 100;
        novoSalario = salario - desconto;
        
        String resultado = String.format(       
            "Valor do novo salário: %.2f ", novoSalario
        );

        JOptionPane.showMessageDialog(null, resultado);  
    }
}
