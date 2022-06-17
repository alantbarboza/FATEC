#include "pilha.h"
#include <time.h>

int main(){
    pilha p;
    int capacidade;
    printf("digite a capacidade da pilha");
    scanf("%d", &capacidade);
    inicia_pilha(&p, capacidade);

    do{
        if(rand()%2){ //empilhar
            if(!pilha_cheia(&p)){
                push(&p, rand()%10);
            }
        }
        else{ //desempilhar
            if(!pilha_vazia(&p)){
                i = pop(&p);
            }
        }
        exibe_pilha(&p);

    }while(!pilha_vazia(&p));
    return 0;
}