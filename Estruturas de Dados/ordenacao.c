#include <stdio.h>
#include <stdlib.h>
#include <time.h>
void gera_vetor (int v[], int n) {
    int i;
    for (i=0; i<n; i++) {
        v[i] = rand();
    }
}
void bubble (int v[], int n) {
    int i, j, aux;
    for (i=1; i<n; i++) {
        for (j=0; j<n-i; j++) {
            if (v[j] > v[j+1]) {
                aux = v[j];
                v[j] = v[j+1];
                v[j+1] = aux;
            }
        }
    }
}
void exibe_vetor (int v[], int n, char * msg) {
    int i;
    printf ("\n%s\n", msg);
    for (i=0; i<n; i++) {
        printf ("%d ", v[i]);
    }
}
int main () {
    int *v, n;
    unsigned int ini, fim;
    srand(time(0));
    printf ("digite o tamanho do vetor (0 - encerra): ");
    scanf ("%d", &n);
    while (n>0) {
        v = (int *) malloc (n * sizeof(int));
        gera_vetor (v, n);
        //exibe_vetor (v, n, "vetor original");
        ini = time(0); //marcando o tempo de início
        bubble (v, n);
        fim = time(0); //marcando o tempo de fim
        printf ("tempo de ordenacao: %u segundos\n", fim - ini);
        //exibe_vetor (v, n, "vetor ordenado");
        free (v);
        printf ("\ndigite o tamanho do novo vetor (0 - encerra): ");
        scanf ("%d", &n);
    }
    return 0;
}