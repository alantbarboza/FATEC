#include <stdio.h>

int main()
{
    float avaliacao,maior,menor,notaFinal;
    
    for(int contador = 1; contador <= 3; contador++){
        printf("Nota da avaliação %d: ",contador);
        scanf("%f" , &avaliacao);
        if (contador == 1){
            maior = menor = avaliacao;
        }else if (maior < avaliacao){
            maior = avaliacao;
        }else if (menor > avaliacao){
            menor = avaliacao;
        }
    }
    notaFinal = (menor + maior)/2;
    printf("Nota final é %.1f",notaFinal);

    return 0;
}