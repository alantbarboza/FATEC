/*
Rescreva a classe do exercício 1 adicionando a ela um construtor que recebe valores
a serem atribuídos às duas variáveis de instância da classe carro.
*/

public class Ex3 {

    //Construtor: Responvavel pela inicialização do objeto
    //Por padrão o construtor inicializa o objeto vazio
    //Quando o construtor é alterado com a adição de parametros
    //O construtor padrão( que não tem parametros) deixa de existir

    private String cor;
    private String fabricante;
    
    // Encapsulamento e Métodos de acesso
    public String getCor(){
        return cor;
    }
    public void setCor(String cor){
        this.cor = cor;
    }
    
    public String getFabricante(){
        return fabricante;
    }
    public void setFabricante(String fabricante){
        this.fabricante = fabricante;
    }



    public Ex3(String cor, String fabricante){
        this.cor = cor;
        this.fabricante = fabricante;
    }

    public void abrirPorta(){
        System.out.printf("\nPorta do carro aberta\n"); 
    }
    
    public void fecharPorta(){
        System.out.printf("\nPorta do carro fechada\n");
    }
    
    public void exibirMensagem (){ 
        System.out.printf ("\nCarro \n Cor: %s \n Fabricante: %s", this.cor, this.fabricante); 
    }    

}