/*
Faça um programa que encontre o maior e 
o menor elemento dentro de uma matriz pré-populada.
*/

#include <stdio.h>

int main(){
    int matriz[3][3] = {{-5,3,7}, {1,0,-1}, {5,8,3}};
    int maior , menor;
    
    for(int linha = 0; linha < 3; linha++){
        for(int coluna = 0; coluna < 3; coluna++){
            if (linha == 0 && coluna == 0){
                maior = menor = matriz[linha][coluna];
            }else if (maior < matriz[linha][coluna]){
                maior = matriz[linha][coluna];
            }else if (menor > matriz[linha][coluna]){
                menor = matriz[linha][coluna];
            }
        }
    }

    printf("O maior valor é %d e o menor valor é %d.",maior,menor);

    return 0;
}