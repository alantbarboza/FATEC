#include <time.h>
#include "fila_ligada.h"

int main (){
    struct fila fila;
    int i;
    srand(time(0));  
    inicia_fila(&fila);
    do{
        if (rand() % 5 > 0){  //se o resultado dessa operação for impar
            enfileira(rand()%10, &fila);
        }
        else{ //se o resultado for par
            if(!esta_vazia(&fila)){  
                printf("%d foi atendido\n", desenfileira(&fila));

            }
        }
        exibe_lista(&fila);
    }while(!esta_vazia(&fila));
    return 0;
}

