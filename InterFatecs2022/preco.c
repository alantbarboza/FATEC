#include <stdio.h>

int main()
{
    double Tr = 0.0 , P = 0.0, V = 0.0;
    
    scanf("%lf",&Tr);
    scanf("%lf",&P);
    scanf("%lf",&V);
    
    printf("%.2lf\n", (P-Tr)*V);

    return 0;
}
