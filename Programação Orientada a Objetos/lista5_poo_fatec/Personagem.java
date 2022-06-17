/* 
1. Adicione um método à classe Personagem que exibe o estado (valores de energia,
fome e sono) dos objetos. Chame ele em cada método existente na sua classe. Ele
deve exibir o nome do personagem seguido dos valores de cada variável.

2. Adicione um novo personagem e inclua ele no “loop do jogo”.
*/ 

public class Personagem {       /*descrevendo o personagem*/

/*O personagem começa com valores 10, 0, 0 para energia, fome e sono,
respectivamente. Ou seja, ele começa com o máximo de energia, sem fome e sem
sono. */
    private String nome;
    private int energia = 10;    //cada objeto tem a sua própria variavel energia.
    private int fome = 0;  
    private int sono = 0;
    final static int LIMITE_SUPERIOR = 10; /*static: variavel da classe ( a mesma 
                                            variavel para todos os objetos/jogo)*/

    /*construtor - todo construtor tem o nome igual a classe*/
    public Personagem(int energia, int fome, int sono){
        if (energia >= 0 && energia <= 10)
            this.energia = energia;
        if (fome >= 0 && fome <= 10)
            this.fome = fome;
        if (sono >= 0 && sono <= 10)
            this.sono = sono;
    }

    public Personagem(String nome, int energia, int fome, int sono){
        this(energia, fome, sono);
        this.nome = nome;
    }
    /*******************************************************/

    public void setNome(String nome){
        this.nome = nome;
    }
    public String getNome(){
        return this.nome;
    }
    public int getEnergia(){
        return this.energia;
    }
    public int getFome(){
        return this.fome;
    }
    public int getSono(){
        return this.sono;
    }


/*Quando o personagem caça, ele gasta dois pontos de energia. Ele somente pode
caçar caso tenha pelo menos dois pontos de energia. Em qualquer caso, seus níveis de
fome e sono sobem de um ponto.*/
    void cacar (){  
        if (this.energia >= 2){
            System.out.println(nome + " caçando...");
            this.energia = this.energia - 2;
        }
        else{
            System.out.println(nome + " sem energia para caçar...");
        }
        this.fome = Math.min(this.fome + 1,LIMITE_SUPERIOR);
        this.sono = Math.min(this.sono + 1,LIMITE_SUPERIOR);
    }

/*Quando o personagem come, ele reduz de 1 ponto seu nível de fome. Além disso,
seu nível de energia aumenta de 1. Ele somente come se tiver nível de fome maior ou
igual a 1.*/
    void comer (){
        if (this.fome >= 1){
            System.out.println(this.nome + " comendo...");
            this.fome -= 1;
            this.energia = this.energia + 1 <= LIMITE_SUPERIOR ? this.energia + 1 : this.energia;
        }
        else{
            System.out.printf("%s sem fome...\n",nome);
        }
    }

/*Quando o personagem dorme, ele reduz de 1 ponto seu nível de sono. Além disso,
seu nível de energia aumenta de 1. Ele somente dorme se tiver nível de sono maior ou
igual a 1.*/
    void dormir (){  
        if (this.sono >= 1){
            System.out.println(String.format(
                "%s dormingo...",
                this.nome 
            ));
            this.sono -= 1;
            this.energia = this.energia + 1 <= LIMITE_SUPERIOR ? this.energia + 1 : this.energia;
            
        }
        else{
            System.out.printf("%s sem sono...\n",nome);
        }
    }

/*Adicione um método à classe Personagem que exibe o estado (valores de energia,
fome e sono) dos objetos.*/
    void estado (){//o GET pega o valor que já está no atributo e exibe na mensagem
        System.out.printf ("\nEstado:\n Personagem: %s \n Energia: %d \n Fome: %d \n Sono: %d",this.getNome() ,this.getEnergia(), this.getFome(), this.getSono()); 
    }
}


/**********************************************************
*    por padrão esses tipos de variaveis começam com:     *
*    byte, short, int, long, float, double: 0             *
*    char: \0                                             *
*    boolean: false                                       *
*    variaveis de referência(String, Personagem): null    *
***********************************************************/