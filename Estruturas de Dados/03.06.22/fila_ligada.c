#include "fila_ligada.h"

void inicia_lista (struct fila *l) {
    l->comprimento = 0;
    l->primeiro = l->ultimo = NULL;
}
int esta_vazia (struct fila *l) {
    return l->comprimento == 0;
}

void enfileira (int i, struct fila *l) {
    struct no * novo = constroi_no(i);
    if (esta_vazia(l)) {
        l->primeiro = novo;
    }
    else {
        l->ultimo->prox = novo;
    }
    l->ultimo = novo;
    l->comprimento++;
}

int remove_inicio (struct fila *l) {
            
    int i = l->primeiro->info; 
    struct no * aux = l->primeiro; //AUX variavel do tipo ponteiro que irá guardar o endereço do campo em que irei pegar a informação
    l->primeiro = l->primeiro->prox; //pega a informação do campo PRIMEIRO da lista L
    if (l->primeiro == NULL) //se o campo PRIMEIRO ficar com o valor igual a NULL
        l->ultimo = NULL;    //o campo ULTIMO recebe o valor de NULL
    l->comprimento--; //o comprimeiro da lista L diminue
    free(aux); //tira o campo vazio em que tiramos a informação
    return i;
}  

void exibe_fila (struct fila *f){
    struct no * aux;
    printf("fila: ");
    if (esta_vazia(f)){
        printf("vazia");
    }
    else{
        aux = f->primeiro;
        while(aux != NULL){
            printf("%d", aux ->info);
            aux = aux->prox;
        }
    }
    printf("\n");
}

