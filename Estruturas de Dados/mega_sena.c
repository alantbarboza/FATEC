#include <stdio.h>
#include <stdlib.h>
#include <time.h>
void gera_jogo (int v[]) {
    int i, j, sorteado, repetiu;
    v[0] = rand() % 60 + 1;
    for (i=1; i<6; i++) {
        sorteado = rand() % 60 + 1;
        repetiu = 0;//falso
        //busca simples
        j=i-1;
        while (j>=0 && !repetiu) {
            if (sorteado == v[j]) {
                repetiu = 1;//verdadeiro
                printf ("repetiu\n");
                i--;
            }
            j--;
        }
        //fim busca simples
        if (!repetiu)
            v[i] = sorteado;
    }
}
void bubble (int v[]) {
    int i, j, aux;
    for (i=1; i<6; i++) {
        for (j=0; j<6-i; j++) {
            if (v[j] > v[j+1]) {
                aux = v[j];
                v[j] = v[j+1];
                v[j+1] = aux;
            }
        }
    }
}
void exibe_jogo (int v[]) {
    int i;
    printf ("Loterias da caixa\nBoa sorte!!!\n\n");
    for (i=0; i<6; i++) {
        printf ("%d ", v[i]);
    }
    printf ("\n**********************************\n");
}
int main () {
    int v[6];
    int continua_jogando = 0;
    srand(time(0));
    do{
        gera_jogo(v);
        bubble(v);
        exibe_jogo(v);
        printf ("\nvai continuar jogando? (0 - parar, 1 - continuar\n--> ");
        scanf ("%d", &continua_jogando);
    } while (continua_jogando);
    return 0;
}