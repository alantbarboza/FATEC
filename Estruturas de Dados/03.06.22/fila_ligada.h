#include "no.h"

struct fila {
    struct no * primeiro;
    struct no * ultimo;
    int comprimento;
};

void inicia_fila (struct fila *);

int esta_vazia (struct fila *);

void exibe_lista (struct fila *);

void insere_fim (int, struct fila *);

int remove_inicio (struct fila *);