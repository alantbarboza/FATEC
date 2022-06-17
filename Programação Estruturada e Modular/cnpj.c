/*
Este projeto destina-se à fixação dos conceitos aprendidos até aqui (vetores, strings e, especialmente, funções e procedimentos).
Como a lógica de validação do CNPJ é muito similar à do CPF, você poderá reforçar suas habilidades de programação.
O algoritmo é explicado no link:

http://www.macoratti.net/alg_cnpj.htm


1) No link acima você encontra a explicação do algoritmo usado pela Receita Federal para validação de um CNPJ.
Estude-o e monte uma planilha em Excel ou Calc para implementar a ideia.

2) Crie um código "base" em C que valida o primeiro dígito verificador. Faça um CTRL+C e CTRL+V com atenção, visto que o algoritmo para o segundo dígito é muito parecido com o do primeiro.

3) Agora vamos melhorar o código anterior com o uso de uma função para validação de um dígito, que você escreverá uma vez e usará duas vezes.

4) Vamos melhorar mais ainda o código anterior trabalhando na nova entrada dos dígitos do CNPJ. Vamos lê-los com uma string e processá-la adequadamente.
*/

#include<stdio.h>
#include<stdbool.h>
#include<string.h>
/*
    CNPJ -> vetor com os dígitos do CNPJ
    mult -> vetor com os multiplicadores, de tamanho N
    N -> Tamanho do vetor mult e também a quantidade de operações (9 ou 10)
*/
int calculaDigito(int cnpj[], int mult[], int N)
{   int soma=0, i;
    for(i=0; i<N; i++)
	{	soma = soma + cnpj[i]*mult[i];
	}

	return  ((soma*10) % 11)%10;
}

/*
    Retorna true se todos os 11 dígitos de um CNPJ forem iguais, caso contrário,
    retorna false.
*/
bool todosRepetidos(int cnpj[])
{   int i;
    for(i=1; i<14; i++)
    {   if(cnpj[0]!=cnpj[i])
            return false;
    }
    return true;
}

/*
    Leio um CNPJ como texto, podendo ou não conter espaços, pontos, hífens, etc.
    Somente os dígitos são levados em consideração. Zeros são acrescentados à
    esquerda caso não haja 14 caracteres.
    Os valores são colocados no vetor que é passado por parâmetro.
*/
void leiaCNPJ(int cnpj[])
{   char texto[50];
    fgets(texto, 50, stdin);
    int i, j=13;
    for(i=strlen(texto)-1; i>=0; i--)
    {   if(texto[i]>='0' && texto[i]<='9')
        {   cnpj[j] = texto[i] - '0';
            j--;
        }
    }
    //preenchendo com zeros à esquerda
    while(j>=0)
    {   cnpj[j] = 0;
        j--;
    }
}

/*
    Imprime um cnpj adicionando pontos e um hífen, como é costumeiro.
*/
void imprimeCNPJ(int cnpj[])
{   int i;
    for(i=0; i<14;i++)
    {   printf("%d", cnpj[i]);
        if(i==1||i==4) printf(".");
        if(i==7) printf("/");
        if(i==11) printf("-");
    }
}

int main()
{   int cnpj[14];
	int m1[12]={5,4,3,2,9,8,7,6,5,4,3,2};
	int m2[13]={6,5,4,3,2,9,8,7,6,5,4,3,2};
	int i;
	printf("Entre com o cnpj: ");
	leiaCNPJ(cnpj);
  	
	if(todosRepetidos(cnpj) == false &&
	   calculaDigito(cnpj, m1, 12) == cnpj[12] &&
	   calculaDigito(cnpj, m2, 13) == cnpj[13])
	{   imprimeCNPJ(cnpj);
	    printf(" é um CNPJ valido.\n");
	}
	else printf("CNPJ inválido.\n");
	
	return 0;
}