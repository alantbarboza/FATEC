#include "pilha.h"

int main(){
    pilha p;
    int capacidade;
    printf("digite a capacidade da pilha");
    scanf("%d", &capacidade);
    inicia_pilha(&p, capacidade);
    return 0;
}