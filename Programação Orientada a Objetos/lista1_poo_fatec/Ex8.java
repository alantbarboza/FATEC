/*
Ler o número total de eleitores de um município, o número de votos brancos, nulos e
válidos. Calcular e escrever o percentual que cada um representa em relação ao total de
eleitores.
*/
import javax.swing.JOptionPane;
public class Ex8 {
    public static void main(String[] x) {
        Double eleitores, votosBrancos, votosNulos, votosValidos;

        eleitores = Double.parseDouble(JOptionPane.showInputDialog("Digite o número total de eleitores: "));
        votosBrancos = Double.parseDouble(JOptionPane.showInputDialog("Digite o número de votos brancos:"));
        votosNulos = Double.parseDouble(JOptionPane.showInputDialog("Digite o número de votos nulos:"));
        votosValidos = Double.parseDouble(JOptionPane.showInputDialog("Digite o número de votos brancos:"));
        
        votosBrancos = (votosBrancos/eleitores) * 100; 
        votosNulos = (votosNulos/eleitores) * 100;
        votosValidos = (votosValidos/eleitores) * 100;
        
        String resultado = String.format(       
            "%.0f eleitores: Percentual: Votos brancos: %.0f%%, Votos nulos: %.0f%%, Votos validos: %.0f%%", eleitores, votosBrancos, votosNulos, votosValidos
        );

        JOptionPane.showMessageDialog(null, resultado);  
    }
}