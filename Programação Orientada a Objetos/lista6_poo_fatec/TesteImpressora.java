/*
Escreva uma classe de teste que chama cada um dos métodos que você escreveu no
exercício 1.
*/

public class TesteImpressora {
    public static void main(String[] args) {
        Impressora  impressora = new Impressora();

        impressora.exibir(1.79f);
        impressora.exibir(2.78f, 4.69f);
        impressora.exibir(1.28f, "OK");
        impressora.exibir("no", 84.452f);
        impressora.exibir("L", "O", "L");
        impressora.exibir(3, 3, "?");

    }
}
