//código base 6
#include <stdio.h>
#include<time.h>
#include<stdlib.h>
#include<stdbool.h>

#define AGUA  0
#define NAVIO  1
#define TIRONAGUA  10
#define TIRONAVIO  11

int main()
{   int i, j, cont;
    bool estrategia = false;
    int iAnterior, jAnterior, partesNavioDerrubadas;
    
    //inicializa a semeste aleatória com o relógio da máquina
    srand(time(NULL));
    
    int matComputador[10][10], matHumano[10][10];
    // Inicializando as matrizes com zeros (ÁGUA)
    for(i=0; i<10; i++)
        for(j=0; j<10; j++)
        {   matComputador[i][j] = AGUA;
            matHumano[i][j] = AGUA;
        }
           
    //Sorteio das posições dos 6 navios
    for(cont=0; cont<6; cont++)
    {   do{
            i = rand()%10; //linha vai de 0 a 9
            j = rand()%8; //coluna vai de 0 a 7
        }while(matComputador[i][j]==NAVIO || matComputador[i][j+1]==NAVIO ||
            matComputador[i][j+2]==NAVIO);
        matComputador[i][j] = NAVIO;
        matComputador[i][j+1] = NAVIO; //coluna seguinte
        matComputador[i][j+2] = NAVIO; //coluna seguinte da seguinte
    }
    
    //entrada das coordenadas dos navios do Humano
    printf("Entre com as coordenadas de seus 6 navios (linha entre 0 e 9, coluna entre 0 e 7):\n");
    for(cont=0; cont<6; cont++)
    {   //Entrada das posições dos navios do Humano
        do{ printf("Navio %d: ", cont+1);
            scanf("%d%d", &i, &j);
            if(i<0 || i>9 || j<0 || j>7)
                printf("Erro na coordenada (fora dos limites)\n");
            else if(matHumano[i][j]==NAVIO || matHumano[i][j+1]==NAVIO ||
                matHumano[i][j+2]==NAVIO)
                printf("Erro na coordenada (sobreposição de navios)\n");
        }while(i<0 || i>9 || j<0 || j>7 || matHumano[i][j]==NAVIO ||
                matHumano[i][j+1]==NAVIO || matHumano[i][j+2]==NAVIO);
        matHumano[i][j] = NAVIO;
        matHumano[i][j+1] = NAVIO; //coluna seguinte
        matHumano[i][j+2] = NAVIO; //coluna seguinte da seguinte
    }
    
    //Imprimindo o tabuleiro do humano
    printf("Imprimindo o Tabuleiro do Humano:\n\n");
    printf("   0 1 2 3 4 5 6 7 8 9\n");
    for(i=0; i<10; i++)
    {   printf("%d |", i);
        for(j=0; j<10; j++)
        {   if(matHumano[i][j]==AGUA) printf(" |");
            else if(matHumano[i][j]==NAVIO) printf("N|");
            else if(matHumano[i][j]==TIRONAGUA) printf("A|");
            else if(matHumano[i][j]==TIRONAVIO) printf("X|");
        }
        printf("\n");
    }
    
    //O jogo pode começar de fato agora
    int pontosHumano = 0, pontosComputador = 0;
    
    printf("E começa o jogo....\n\n");
    
    //enquanto ninguém fez 18 pontos....
    while(pontosHumano<18 && pontosComputador<18)
    {
        //leio jogada do Humano
        bool coordenadaJaDigitada;
        do{ coordenadaJaDigitada = false;
            printf("Entre com as coordenadas de um tiro (linha e coluna entre 0 e 9):\n");
            do{ scanf("%d%d", &i, &j);
                if(i<0 || i>9 || j<0 || j>9)
                    printf("Erro na coordenada (fora dos limites)\n");
            }while(i<0 || i>9 || j<0 || j>9);
            
            //atualizo o tabuleiro do Computador e o placar do Humano
            if(matComputador[i][j] == AGUA)
            {   matComputador[i][j] = TIRONAGUA;
                printf("Esse foi um tiro na água...\n");
            }
            else if(matComputador[i][j] == NAVIO)
            {   matComputador[i][j] = TIRONAVIO;
                printf("Acertou!!!...\n");
                pontosHumano++;
            }
            else
            {   printf("Você já atirou aqui... Preste mais atenção!!!\n");
                coordenadaJaDigitada = true;
            }
        }while(coordenadaJaDigitada);
        
        if(estrategia == false) //jogada aleatória
        {   //gero a jogada aleatória do Computador (sem estratégia)
            printf("\nAgora é a vez do computador....\n");
            do{ coordenadaJaDigitada = false;
                i = rand()%10; //linha vai de 0 a 9
                j = rand()%10; //coluna vai de 0 a 9
                
                //atualizo o tabuleiro do Humano e o placar do Computador
                if(matHumano[i][j] == AGUA)
                {   matHumano[i][j] = TIRONAGUA;
                    printf("O computador atirou na água...\n");
                }
                else if(matHumano[i][j] == NAVIO)
                {   matHumano[i][j] = TIRONAVIO;
                    printf("O computador acertou!!!...\n");
                    pontosComputador++;
                    iAnterior = i;
                    jAnterior = j;
                    estrategia = true;
                    partesNavioDerrubadas = 1;
                }
                else
                {   //computador já atirou aqui...
                    coordenadaJaDigitada = true;
                }
            }while(coordenadaJaDigitada);
        }
        else //jogada com estratégia
        {   do{ coordenadaJaDigitada = false;
                i = iAnterior;
                j = jAnterior + 1;
                
                //atualizo o tabuleiro do Humano e o placar do Computador
                if(matHumano[i][j] == AGUA)
                {   matHumano[i][j] = TIRONAGUA;
                    printf("O computador atirou na água...\n");
                    j = jAnterior - 4;
                }
                
                else if(matHumano[i][j] == NAVIO)
                {   matHumano[i][j] = TIRONAVIO;
                    printf("O computador acertou!!!...\n");
                    pontosComputador++;
                    iAnterior = i;
                    jAnterior = j;
                    partesNavioDerrubadas++;
                    if(partesNavioDerrubadas == 3) //atingi 3 partes, volto para o aleatório
                        estrategia = false;
                }
                else
                {   //computador já atirou aqui...
                    coordenadaJaDigitada = true;
                    jAnterior = jAnterior - 3;
                }
            }while(coordenadaJaDigitada);
            
        }
        
        //mostro os tabuleiros atualizados
        
        //Imprimindo o tabuleiro do computador
        printf("Imprimindo o Tabuleiro do Computador:\n\n");
        printf("   0 1 2 3 4 5 6 7 8 9\n");
        for(i=0; i<10; i++)
        {   printf("%d |", i);
            for(j=0; j<10; j++)
            {   if(matComputador[i][j]==AGUA) printf(" |");
                else if(matComputador[i][j]==NAVIO) printf(" |");
                else if(matComputador[i][j]==TIRONAGUA) printf("A|");
                else if(matComputador[i][j]==TIRONAVIO) printf("X|");
            }
            printf("\n");
        }
        
        //Imprimindo o tabuleiro do humano
        printf("Imprimindo o Tabuleiro do Humano:\n\n");
        printf("   0 1 2 3 4 5 6 7 8 9\n");
        for(i=0; i<10; i++)
        {   printf("%d |", i);
            for(j=0; j<10; j++)
            {   if(matHumano[i][j]==AGUA) printf(" |");
                else if(matHumano[i][j]==NAVIO) printf("N|");
                else if(matHumano[i][j]==TIRONAGUA) printf("A|");
                else if(matHumano[i][j]==TIRONAVIO) printf("X|");
            }
            printf("\n");
        }

        //mostro o placar atualizado
        printf("PLACAR:\n\n");
        printf("HUMANO\tCOMPUTADOR\n");
        printf("%5d\t%5d\n\n", pontosHumano, pontosComputador);
    }
    //mostro o vencedor
    if(pontosComputador == 18)
        printf("Você perdeu para o Computador!! Patinho!\n");
    else
        printf("Você ganhou! Parabéns!!\n");
        
    return 0;
}

