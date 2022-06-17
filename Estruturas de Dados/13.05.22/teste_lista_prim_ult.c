#include "lista_prim_ult.h"

int main () {
    struct lista_prim_ult sl;
    inicia_lista (&sl);
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
    return 0;
}