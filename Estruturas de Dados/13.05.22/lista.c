#include "lista.h"
void inicia_lista (struct lista *l) {
    l->primeiro = NULL;
}
int esta_vazia (struct lista *l) {
    /*if (l->primeiro == NULL) {
        return 1;
    }
    else {
        return 0;
    }
    */
   return l->primeiro == NULL;
}
void insere_inicio (int i, struct lista *l) {
    struct no * novo = constroi_no(i);
    if (!esta_vazia(l)) {
        novo->prox = l->primeiro;
    }
    l->primeiro = novo;
}
void exibe_lista (char * msg, struct lista *l) {
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
void insere_fim (int i, struct lista *l) {
    struct no * aux;
    struct no * novo = constroi_no(i);
    if (esta_vazia(l)) {
        l->primeiro = novo;
    }
    else {
        aux = l->primeiro;
        while (aux->prox != NULL) {  //procura do último da lista
            aux = aux->prox;
        }
        aux->prox = novo;
    }
}
int remove_inicio (struct lista *l) {
    //copiar o elemento que vai ser removido e retornado
    int i = l->primeiro->info;
    //copiar o endereço de memória que vai ser liberado
    struct no * aux = l->primeiro;
    l->primeiro = l->primeiro->prox;
    //libero a memória do elemento removido
    free(aux);
    //devolvo o elemento que saiu da lista
    return i;
}
int remove_fim (struct lista *l) {
    int i; //vai receber a informação do último nó
    struct no * aux = l->primeiro; //vai receber o endereço do nó a ser removido
    //verificar se existe um único elemento na lista
    if (l->primeiro->prox == NULL) { //sim, tem um só
        i = l->primeiro->info;
        l->primeiro = NULL;
        free(aux);
    }
    else { //não, tem mais que um
        while (aux->prox->prox != NULL) {
            aux = aux->prox;
        }
        i = aux->prox->info;
        free(aux->prox);
        aux->prox = NULL;
    }
    return i;
}

int tamanho (struct lista *l) {
    int cont = 0;
    struct no * aux = l->primeiro;
    while (aux != NULL) {
        cont++;
        aux = aux->prox;
    }
    return cont;
}

int insere_posicao (struct lista *l, int e, int p) {
    int t = tamanho(l);
    int cont;
    struct no * aux;
    struct no * novo;
    if (p < 0 || p > t)
        return 0;
    if (p == 0) {
        insere_inicio(e, l);
        return 1;
    }
    if (p == t) {
        insere_fim(e, l);
        return 1;
    }
    cont = 0;
    aux = l->primeiro;
    while (cont < p-1) {
        cont++;
        aux = aux->prox;
    }
    novo = constroi_no(e);
    novo->prox = aux->prox;
    aux->prox = novo;
    return 1;
}

int remove_posicao (struct lista *l, int p) {
    int t = tamanho(l);
    int cont, e;
    struct no * aux;
    struct no * lixo;
    if (p < 0 || p > t)
        return -1;
    if (p == 0) {
        return remove_inicio(l);
    }
    if (p == t-1) {
        return remove_fim(l);
    }
    cont = 0;
    aux = l->primeiro;
    while (cont < p-1) {
        cont++;
        aux = aux->prox;
    }
    e = aux->prox->info;
    lixo = aux->prox;
    aux->prox = aux->prox->prox;
    free(lixo);
    return e;
}
