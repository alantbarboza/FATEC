#include "no.h"
struct lista {
    struct no * primeiro;
};

void inicia_lista (struct lista *);

int esta_vazia (struct lista *);

void insere_inicio (int, struct lista *);

void exibe_lista (char *, struct lista *);

void insere_fim (int, struct lista *);

int remove_inicio (struct lista *);

int remove_fim (struct lista *);

int tamanho (struct lista *);

int insere_posicao (struct lista *, int, int);

int remove_posicao (struct lista *, int);

int tem_na_lista(struct lista *, int);

void lista_parEimpar (char *, struct lista *);

int p_posicao(struct lista *, int);
