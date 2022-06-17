#include <stdio.h>

int main()
{
    int l, c;
    
    scanf("%i %i",&l, &c);
    
    long int mapa[l][c];
    long cond;
    
    for(int contL = 0; contL < l; contL++)
    {
        for(int contC = 0; contC < c; contC++)
        {
            if(contL == 0) cond = 0;
            else if(contC == c-1) cond = 1;
            else if(contL == l-1) cond = 2;
            else if (contC == 0) cond = 3;
            else cond = mapa[contL][contC-1] + mapa[contL-1][contC] + mapa[contL-1][contC-1];
            
            mapa[contL][contC] = cond;
        }
    }
    
    int localL, localC;
    
    scanf("%i %i",&localL, &localC);
    
    printf("%ld",mapa[localL-1][localC-1]);
    

    return 0;
}
