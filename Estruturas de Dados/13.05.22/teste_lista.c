#include "lista.h"

int main () {
    struct lista sl;
    inicia_lista (&sl);
    int n;
    exibe_lista("lista inicializada", &sl);
    insere_inicio(1, &sl);
    insere_inicio(3, &sl);
    insere_inicio(5, &sl);
    insere_inicio(7, &sl);
    exibe_lista("lista depois das insercoes de inicio", &sl);
    insere_fim(2, &sl);
    insere_fim(4, &sl);
    insere_fim(6, &sl);
    insere_fim(8, &sl);
    exibe_lista("lista depois das insercoes de fim", &sl);

    if (esta_vazia(&sl)) {
        printf ("lista vazia, nao ha o que remover!\n");
    }
    else {
        printf ("\n%d foi removido do inicio", remove_inicio(&sl));
        exibe_lista("lista depois da remocao de inicio", &sl);
    }
    if (esta_vazia(&sl)) {
        printf ("lista vazia, nao ha o que remover!\n");
    }
    else {
        printf ("\n%d foi removido do fim", remove_fim(&sl));
        exibe_lista("lista depois da remocao de fim", &sl);
    }

    if (insere_posicao(&sl, 12, -1)) {
        printf ("insercao na posicao -1 ok");
        exibe_lista("insercao na posicao -1", &sl);
    }
    else {
        printf ("posicao invalida\n");
    }
    if (insere_posicao(&sl, 12, 0)) {
        printf ("insercao na posicao 0 ok");
        exibe_lista("insercao na posicao 0", &sl);
    }
    else {
        printf ("posicao invalida\n");
    }
    if (insere_posicao(&sl, 21, 7)) {
        printf ("insercao na posicao 7 ok");
        exibe_lista("insercao na posicao 7", &sl);
    }
    else {
        printf ("posicao invalida\n");
    }
    if (insere_posicao(&sl, 33, 4)) {
        printf ("insercao na posicao 4 ok");
        exibe_lista("insercao na posicao 4", &sl);
    }
    else {
        printf ("posicao invalida\n");
    }

    if ((n=remove_posicao(&sl, 27)) != -1) {
        printf ("remocao posicao 27 ok, saiu o %d", n);
        exibe_lista("remocao da posicao 27\n", &sl);
    }
    else {
        printf ("nao tem a posicao 27\n");
    }
    if ((n=remove_posicao(&sl, 0)) != -1) {
        printf ("remocao posicao 0 ok, saiu o %d", n);
        exibe_lista("remocao da posicao 0", &sl);
    }
    else {
        printf ("nao tem a posicao 0\n");
    }
    if ((n=remove_posicao(&sl, 7)) != -1) {
        printf ("remocao posicao 7 ok, saiu o %d", n);
        exibe_lista("remocao da posicao 7", &sl);
    }
    else {
        printf ("nao tem a posicao 7\n");
    }
    if ((n=remove_posicao(&sl, 3)) != -1) {
        printf ("remocao posicao 3 ok, saiu o %d", n);
        exibe_lista("remocao da posicao 3", &sl);
    }
    else {
        printf ("nao tem a posicao 3\n");
    }
    return 0;
}