import javax.swing.JOptionPane; //importar pacotes
public class Soma {
    public static void main(String[] x) {
        //declaração de variáveis
        double op1, op2, res;

        //entrada de dados1
        op1 = Double.parseDouble(JOptionPane.showInputDialog("Digite o primeiro operando"));
        op2 = Double.parseDouble(JOptionPane.showInputDialog("Digite o segundo operando"));
        
        //processamento
        res = op1 + op2;   //o + aqui está somando

        //EXEMPLOS DE SAÍDAS
        //String s = op1 + " + " + op2 + " + " + " = " + res;   //o + aqui está concatenando (ajuntando a frase) 
        
        String s = String.format(       //.format códigos de formatação:   %.2f - tipos reais, 2f duas casas depois da virgula
            "Resultado: %.2f.", res
        );
        JOptionPane.showMessageDialog(null, s);  //metodo showMessageDialog mostra o resultado na tela
    }
}
