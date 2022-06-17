#include "pilha_ligada.h"
#include <stdlib.h>
#include "no.h"

void inicia_pilha (pilha *p){  
    p->topo = NULL;             
}                                                                     

int pilha_vazia (pilha *p){
    return p->topo == NULL;
}

void push (pilha *, int i){
    struct no * novo = constro1_no(i);
    if (!pilha_vazia(p)){
        novo->prox = p->topo;
    }
    p->topo = novo;
}
int pop (pilha *p){
    int i = p->topo->info;
    struct no * aux = p->topo;
    p->topo = p->topo->prox;
    free(aux);
    return i;
}

int peek (pilha *p){
    return p->topo->info;
}
void exibe_pilha(pilha *p){
    struct no * aux = p->topo;
    while(aux != NULL){
        printf("%d", aux->info);
        aux = aux->prox;
    }
    printf("\n");
}

void exibe_pilha (pilha *);