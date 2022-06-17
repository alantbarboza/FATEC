#include <stdio.h>

int main()
{
    int VetorA [] = {1,2,3,4,5}; 
    int VetorB [] = {2, -2, 0, 4, -2};
    int i, prod_escalar = 0;
    
    for ( i = 0; i < 5; i++){
        prod_escalar = prod_escalar + (VetorA[i]*VetorB[i]);
    }
    printf("Resultado %d", prod_escalar);
    
    return 0;
}