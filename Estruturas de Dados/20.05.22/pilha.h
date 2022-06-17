#include <stdio.h>
#include <stdlib.h>

typedef struct { //struct agrupa dados
    int topo;
    int * dados; 
    int capacidade = t;
}pilha;  //o typedef recebe o apelido / nome de pilha

void inicia_pilha(pilha *);

int pilha_vazia (pilha *);
int pilha_cheia (pilha *);

void push (pilha *, int);
int pop (pilha *);

int peek (pilha *);