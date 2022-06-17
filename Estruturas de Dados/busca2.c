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

int busca_simples(int * v, int n, int x){ //vetor  , tamanho , elemento buscado
    int i;
    for (i=0; i<n; i++){
        if(v[i] == x)
            return 1;  //1 = verdadeiro
    return 0;          //0 = falso
    }
}

//implementar a contagem do número de ocorrência
int busca_binario (int *v, int n, int x){
    int ini, fim, meio;
    ini = 0;
    fim = n-1;
    while(ini <= fim){
        meio = (ini + fim) / 2;
        if (x == v[meio]){
            return 1;
        }
        else if (x > v[meio]){
            ini = meio + 1;
        }
        else{
            fim = meio - 1;
        }
    }
    return 0;
}

int main () {
    int *v, n;
    unsigned int ini, fim, x, achou_x;
    srand(time(0));
    printf ("digite o tamanho do vetor (0 - encerra): ");
    scanf ("%d", &n);
    while (n>0) {
        v = (int *) malloc (n * sizeof(int));
        gera_vetor (v, n);
        exibe_vetor(v, n, "vetor gerado");
        printf("\n Digite o elemento para busca");
        scanf ("%d", &x);
        achou_x = busca_simples(v, n, x); //V:vetor N:tamanho X:elemento para busca
        if (achou_x) //se o valor for 1, ou seja, verdade
            printf("\nElemento encontrado pela busca simples\n");
        else //se o valor for 0, ou seja, falso
            printf("\nElemento não encontrado pela busca simples\n");
        bubble(v, n); //tem que ordenar antes da busca binária
        if (busca_binario(v, n , x))
            printf("\nElemento encontrado pela busca binaria\n");
        else //se o valor for 0, ou seja, falso
            printf("\nElemento não encontrado pela busca binaria \n");
    }
    return 0;
}