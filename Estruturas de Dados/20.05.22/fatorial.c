#include <stdio.h>

int fat(int n){
    int i,f;
    for (i=2, f=1; i<=n; f=f*1, i++);
    return f;
}
int main(){
    int n;
    for (n=0; n<13; n++){
        printf("Fatorial de %d = %d\n", n,fat(n));
    }
    return 0;
}
