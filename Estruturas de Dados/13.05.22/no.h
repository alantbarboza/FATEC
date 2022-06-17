#include <stdlib.h>
#include <stdio.h>

struct no{
    int info;
    struct no * prox;
};

struct no * constroi_no(int);

/*
struct <tag> {

};

int a;
char palavra[12];

struct no coisa;

typedef struct no {
    int info;
    struct no * prox;
} t_no;

struct no novo_no;
t_no outro_no;
*/
