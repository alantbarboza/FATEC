#include "lista_prim_ult.h"

void inicia_lista (struct lista_prim_ult *l) {
    l->comprimento = 0;
    l->primeiro = l->ultimo = NULL;
}
int esta_vazia (struct lista_prim_ult *l) {
    return l->comprimento == 0;
}
void insere_inicio (int i, struct lista_prim_ult *l) {
    struct no * novo = constroi_no(i);
    if (esta_vazia(l)) {
        l->ultimo = novo;
    }
    else {
        novo->prox = l->primeiro;
    }
    l->primeiro = novo;
    l->comprimento++;
}
void insere_fim (int i, struct lista_prim_ult *l) {
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

int remove_inicio (struct lista_prim_ult *l) {
    int i = l->primeiro->info;
    struct no * aux = l->primeiro;
    if (l->comprimento == 1) {
        l->ultimo = NULL;
    }
    l->primeiro = l->primeiro->prox;
    l->comprimento--;
    free(aux);
    return i;
}
int remove_fim (struct lista_prim_ult *l) {
    int i;
    struct no * aux = l->primeiro;
    if (l->comprimento == 1) {
        i = l->primeiro->info;
        l->primeiro = l->ultimo = NULL;
        free(aux);
    }
    else {
        while (aux->prox->prox != NULL)
            aux = aux->prox;
        i = aux->prox->info;
        free(aux->prox);
        aux->prox = NULL;
    }
    l->comprimento--;
    return i;
}
void exibe_lista (char * msg, struct lista_prim_ult *l) {
    struct no * aux;
    printf ("\n%s: ", msg);
    if (esta_vazia(l)) {
        printf ("esta vazia\n");
    }
    else {
        aux = l->primeiro;
        while (aux != NULL) {  //procura do final da lista
            printf ("%d -> ", aux->info);
            aux = aux->prox;
        }
        printf ("//\n");
    }
}
int tamanho (struct lista_prim_ult *l) {
    return l->comprimento;
}
//exercicio 6
void lista_parEimpar (char * msg, struct lista_prim_ult *l) {
    struct no * aux;
    printf ("\n%s", msg);
    if (esta_vazia(l)) {
        printf ("esta vazia\n");
    }
    else {   //exercicio 6
        aux = l->primeiro;
        printf("PAR: ");
        while (aux != NULL) {  //procura do final da lista
            if (aux->info % 2 == 0){ //se for par
                printf ("%d -> ", aux->info);
            }
            aux = aux->prox;
        }
        printf ("//\n");
        aux = l->primeiro;
        printf("IMPAR: ");
        while (aux != NULL) {  //procura do final da lista
            if (aux->info % 2 != 0){ //se for impar
                printf ("%d -> ", aux->info);
            }
            aux = aux->prox;
        }
        printf ("//\n");
    }
}
//exercicio 5
int p_posicao(struct lista_prim_ult * l, int valor){  
    struct no * aux = l->primeiro;
    int contador = 0;
    while (aux != NULL) {
        if(aux->info == valor)
            return contador;
      
        aux = aux->prox;
        contador++;
    }
    return -1; 
}

