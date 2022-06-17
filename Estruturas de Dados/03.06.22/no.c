#include "no.h" //"" = biblioteca criada por você (Caso não esteja nesta pasta, declare o caminho dela)

struct no * constroi_no(int i){ //construtor em C
    struct no * novo_no;
    novo_no = (struct no *) malloc (sizeof(struct no));
    if(novo_no != NULL){
        novo_no->info = i;
        novo_no->prox = NULL;
    }
    return novo_no;
}