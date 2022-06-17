/*
Escreva uma classe para representar carros. Adicione a ela dois atributos e dois
métodos que lhe pareçam razoáveis. Os dois atributos devem ser encapsulados.
Escreva métodos getters/setters para cada um deles.
*/

public class Ex1 { //carros

// ATRIBUTOS
    private String fabricante;
    private String cor;

    public void setCor(String cor) {
        this.cor = cor;
    }
    public String getCor() {
        return cor;
    }

    public void setFabricante(String fabricante) { //pega o valor que o user escreveu e envia o valor para o atributo "fabricante"
        this.fabricante = fabricante;  //this simboliza o nome do obj que chamou o set
    }
    public String getFabricante() { //pega os dados do atributo "fabricante" para exibir no metodo "exibirMensagem"
        return fabricante;
    }

// MÉTODOS
    public void abrirPorta(){
        System.out.printf("\nPorta do carro aberta\n"); 
    }

    public void fecharPorta(){
        System.out.printf("\nPorta do carro fechada\n");
    }

    public void exibirMensagem (){ //o GET pega o valor que já está no atributo e exibe na mensagem
        System.out.printf ("\nCarro \n Cor: %s \n Fabricante: %s", this.getCor(), this.getFabricante()); 
    }   
}
