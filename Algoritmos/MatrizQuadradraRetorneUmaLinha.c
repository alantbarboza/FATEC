/* 
Crie uma função que receba uma matriz quadrada como parâmetro e que retorne a linha em que
se encontra o maior número de números '1'; caso haja empate, o índice da primeira linha deverá ser retornado.
Exemplos: dadas as matrizes abaixo, seus retornos são indicados. 

   0 1 2 3           Retorno:
 ---------
0| 0 0 0 0
1| 0 1 1 0              => 1
2| 0 0 0 0
3| 0 1 0 0
     
   0 1 2 3          Retorno:
 -----------
0| 0 0 0 0
1| 0 0 0 0            => 2
2| 1 1 1 0
3| 0 1 1 1

   0 1 2 3          Retorno:
 ---------
0| 0 0 0 0
1| 0 0 0 0             => 0
2| 0 0 0 0
3| 0 0 0 0

*/

#include <stdio.h>

int main(){
    int matriz[4][4] = {{1,1,1,0}, {1,1,1,1}, {0,0,0,0}, {1,0,0,0}};
    int contador = 0, guardaX = 0, maior = 0;
    
    for(int linha = 0; linha < 4; linha++){
        for(int coluna = 0; coluna < 4; coluna++){
            
            if (matriz[linha][coluna] == 1)
                contador += 1;
               
            if (linha == 0 && coluna == 0){
                maior = contador;
                guardaX = linha;
            }else if (maior < contador && maior != contador){
                maior = contador;
                guardaX = linha;
            }
        }
        contador = 0;
    }

    printf(" %d ", guardaX);

    return 0;
}
