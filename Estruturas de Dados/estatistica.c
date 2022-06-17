#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main (){
    int cont_cara = 0, cont_coroa=0, i;
    srand(time(0)); //inicializando   gerar um numero aleatorio a partir do horário atual da máquina(milisegundos)
    for (i=0; i<100000; i++){ 
        if (rand() % 2){ //se for 1 é verdadeiro    
            cont_coroa++;
        }
        else{   //se der 0 é falso
            cont_cara++;
        }
    }
    printf("caras: %d\ncoroas: %d\n", cont_cara, cont_coroa);
    return 0;
}