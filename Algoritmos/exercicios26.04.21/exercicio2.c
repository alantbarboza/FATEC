#include <stdio.h>

int main()
{
    int VetorA [] = {2,0,7,4,9}; 
    int VetorB [] = {4, 5, 1, -9, -2};
    int i, prod_escalar = 0;
    
    for ( i = 0; i < 5; i++){
        prod_escalar = prod_escalar + (VetorA[i]*VetorB[i]);
    }
    printf("Resultado %d", prod_escalar);
    
    return 0;
}