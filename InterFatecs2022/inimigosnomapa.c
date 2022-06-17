/******************************************************************************

Welcome to GDB Online.
GDB online is an online compiler and debugger tool for C, C++, Python, PHP, Ruby, 
C#, VB, Perl, Swift, Prolog, Javascript, Pascal, HTML, CSS, JS
Code, Compile, Run and Debug online from anywhere in world.

*******************************************************************************/
#include <stdio.h>

int main()
{
    
    int I=0, II=0, III=0, IV=0;
    int valorIni;
    int x=0,y=0;
    
    scanf("%i",&valorIni);
    
    
    for(int cont = 0; cont < valorIni; cont++)
    {
        scanf("%i %i",&x,&y);
            
        if(x > 0 && y > 0) I++;
        if (x > 0 && y < 0) II++;
        if (x < 0 && y < 0) III++;
        if (x < 0 && y > 0) IV++;
    }

    printf("I = %i\nII = %i\nIII = %i\nIV = %i\n",I,II,III,IV);
    
    return 0;
}
