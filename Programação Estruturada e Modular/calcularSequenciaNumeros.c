/*
7. Dadas duas sequências com n números inteiros entre 0 e 9, interpretadas como dois números inteiros de n algarismos, calcular a sequência de números que representa a soma dos dois inteiros.

Exemplo: n = 8,
1ª sequência 8 2 4 3 4 2 5 1
2ª sequência 3 3 7 5 2 3 3 7  +
         -----------------------
             1 1 6 1 8 6 5 8 8

*/

#include <stdio.h>

int main()
{
    int seq1[] = {8 , 2 , 4 , 3 , 4 , 2 , 5 , 1};
    int seq2[] = {3 , 3 , 7 , 5 , 2 , 3 , 3 , 7};
    int seq3[9];
    int i, vaium = 0;
    
    for(i = 7; i>=0; i--){
        seq3[i + 1] = (seq1[i] + seq2[i] + vaium) % 10;
        vaium = (seq1[i] + seq2[i] + vaium) / 10;
    
    }
    
    seq3[0] = vaium;
    
    for(i = 0;i<7; i++){
        printf(" %d ",seq1[i]);
    }
    printf("+ \n");
    for(i = 0;i<7; i++){
        printf(" %d ",seq2[i]);
    }
    printf("\n");
    printf("====================");
    printf("\n");
    
    for(i=0; i < 9; i++){
        printf(" %d",seq3[i]);

    } 
    return 0;
}

