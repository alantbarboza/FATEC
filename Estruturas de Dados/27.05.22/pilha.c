#include "pilha.h"
void inicia_pilha (pilha *p, int t){
    p-> dados = (int *) malloc (t * sizeof(int));
    p->topo = 0;
    p->capacidade = t;
}

void inicia_pilha(pilha *p){
    return p->topo=0;
};

int pilha_vazia (pilha *){
    return p->topo==0;
}
int pilha_cheia (pilha *){
    return p->topo == p->capacidade;
}

void push (pilha *p, int i){ //pós incremento
    p->dados[p->topo++] = i;
}
int pop (pilha *p){ //pré decremento
    return p->dados[--p->topo];

}
int peek (pilha *p){ //consulta
    return p->dado[p->topo-1];
}