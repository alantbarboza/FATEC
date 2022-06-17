/*
Implemente o jogo proposto em aula, em que o algoritmo deverá descobrir o número 
pensado através de algumas tentativas.
*/

#include <stdio.h>
#include <stdlib.h>

int main()
{   int chute, cont=0, inicio, meio, fim;
    
    printf("Pense num número entre 1 e 1000!!\n\n");
    
    inicio = 1;
    fim = 1000;
    do{ 
        cont++;
        meio = (inicio + fim)/2;
        printf("Eu vou tentar adivinhar: O número é %d?\n", meio);
        printf("Diga se acertei (1), chutei alto (2) ou chutei baixo (3):");
        scanf("%d", &chute);
        if (chute == 2){ //se caso chutar alto
            fim = meio - 1;
        }else{ //se caso chutar baixo
            inicio = meio + 1;
        }
    } while(chute != 1);    
      
   
    printf("\nEu acertei em %d tentativas!\n", cont);
    
 return 0;
}



