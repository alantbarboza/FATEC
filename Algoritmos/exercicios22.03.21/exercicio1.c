#include <stdio.h>

int main()
{
    int frente,direita,esquerda;
    printf("Distância do sensor da frente: ");
    scanf("%d" , &frente);
    printf("Distância do sensor da direita: ");
    scanf("%d" , &direita);
    printf("Distância do sensor da esquerda: ");
    scanf("%d" , &esquerda);
    if (frente > 50) {
        printf("comando: frente");
    }else if (direita > 50) {
        printf("comando: direita");
    }else if (esquerda > 50) {
        printf("comando: esquerda");
    }else{
        printf("comando: trás(ré)");
    }

    return 0;
}
