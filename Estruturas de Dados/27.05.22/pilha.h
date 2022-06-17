#include <stdio.h>
#include <stdlib.h>

typedef struct { //struct agrupa dados
    int topo;
    int * dados; 
    int capacidade;
}pilha;  //o typedef recebe o apelido / nome de pilha

void inicia_pilha(pilha *int);

int pilha_vazia (pilha *);
int pilha_cheia (pilha *);

void push (pilha *, int);
int pop (pilha *);

int peek (pilha *);

void exibe_pilha(pilha *p){
    int i;
    for (i=p->topo-1; i>=0; i--)
        printf("%d", p->dadps[i]);
    printf("\n");
}