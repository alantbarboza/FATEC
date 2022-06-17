#include <stdlib.h>
#include <stdio.h>

struct no{
    int info;
    struct no * prox;
};

struct no * constroi_no(int);

