#include "no.h"

struct lista_prim_ult {
    struct no * primeiro;
    struct no * ultimo;
    int comprimento;
};

void inicia_lista (struct lista_prim_ult *);

int esta_vazia (struct lista_prim_ult *);

void insere_inicio (int, struct lista_prim_ult *);

void exibe_lista (char *, struct lista_prim_ult *);

void insere_fim (int, struct lista_prim_ult *);

int remove_inicio (struct lista_prim_ult *);

int remove_fim (struct lista_prim_ult *);

int tamanho (struct lista_prim_ult *);