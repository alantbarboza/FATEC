/*
1) Inclua novos campos, como endereço, e-mail, data de nascimento, etc.

2) Crie uma função procurar, com a assinatura abaixo, de modo que ela possa ser aproveitada tanto na funcionalidade procurar, quanto na excluir:

int procurar(char procurado[], struct ficha vetor[], int num_fichas)

O retorno dessa função será o índice do elemento encontrado, ou -1, caso o mesmo não tenta sido localizado.

3) Reimplemente a função procurar de modo recursivo (particularmente não há nenhuma vantagem nesta alteração, é só para treinarmos recursividade).

DICA: Estou colando aqui o exercício 10 da lista de recursividade:

10) Crie uma função recursiva que procure um número dentro de um vetor, a partir de um dado índice. Se achar o mesmo, o método retorna o índice onde ele se encontra, senão, retorna -1.


4) Refaça a funcionalidade de exclusão de modo a não ter que copiar todos os elementos abaixo do excluído.

Código a ser substituído:
int j;
       for(j=i+1; j<fichas_existentes; j++)
       {
    agenda[j-1] = agenda[j];
       }
       fichas_existentes--;
       proxima--;


5) Refaça o procurar de modo a trabalhar mesmo com pedaços de nomes (dica: pesquise uma função chamada "strstr").

6) Crie uma funcionalidade de alterar (Update do crud).
*/

#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#include <locale.h>
#include <stdlib.h>

struct ficha{
	char nome[40];
	char telefone[20];
	char endereco[20];
	char email[20];
	char dataNascimento[20];
	bool ativo;
};

int procurar(char procurado[], struct ficha vetor[], int num_fichas){

    if(num_fichas <= 0) return -1;
    else if(strstr(vetor[num_fichas-1].nome, procurado) != NULL) return num_fichas-1;
    else return procurar(procurado, vetor, num_fichas-1);
        
}

int main()
{
	struct ficha agenda[100];
	int fichas_existentes = 0, proxima = 0;
	char opcao[10]="0"; 
        setlocale(LC_ALL, "Portuguese");

	while(opcao[0] != '6')
	{

		printf("\nEntre com a opção desejada:\n");
		printf("\n1) Inserir ficha:");
		printf("\n2) Procurar por nome:");
		printf("\n3) Listar toda a base:");
		printf("\n4) Update/alterar dados:");
		printf("\n5) Excluir por nome:");
		printf("\n6) Sair\n\n");
		gets(opcao);

		if(opcao[0] == '1') //inserir
		{
			printf("\nEntre com um nome:");
			gets(agenda[proxima].nome);
			printf("\nEntre com um telefone:");
			gets(agenda[proxima].telefone);
			printf("\nEntre com um endereço:");
			gets(agenda[proxima].endereco);
			printf("\nEntre com um e-mail:");
			gets(agenda[proxima].email);
			printf("\nEntre com uma data de nascimento:");
			gets(agenda[proxima].dataNascimento);
			agenda[proxima].ativo = true;
			
			fichas_existentes++;
			proxima++;
		}
		if(opcao[0] == '2') //procurar
		{
			char procurado[40];
			printf("\nEntre com o nome procurado:");
			gets(procurado);
            char resp[10];
            
            do {
    			int i = procurar(procurado, agenda, fichas_existentes);
     		    if(i >= 0 && agenda[i].ativo == true){
    			    printf("\n\nO telefone de %s é %s",
    			      agenda[i].nome, agenda[i].telefone);
    			    printf("\nO endereço de %s é %s",
    			      agenda[i].nome, agenda[i].endereco);
    			    printf("\nO email de %s é %s",
    			      agenda[i].nome, agenda[i].email);
    			    printf("\nA data de nascimento de %s é %s\n",
    			      agenda[i].nome, agenda[i].dataNascimento);
    			}
    			else printf("\n\nNome não encontrado\n");
    			
    			printf("Deseja continuar a busca? (S/N) -> ");
    			gets(resp);
    			if(resp[0] == 's' || resp[0] == 'S')
    			    fichas_existentes = fichas_existentes-1;
            } while(resp[0] == 's' || resp[0] == 'S');
		}
		if(opcao[0] == '3') //listar tudo
		{
			printf("\n\n");
			int i;
			for(i=0; i<fichas_existentes; i++)
			{
			    if(agenda[i].ativo == true){
    			    printf("\n\nO telefone de %s é %s",
    			      agenda[i].nome, agenda[i].telefone);
    			    printf("\nO endereço de %s é %s",
    			      agenda[i].nome, agenda[i].endereco);
    			    printf("\nO email de %s é %s",
    			      agenda[i].nome, agenda[i].email);
    			    printf("\nA data de nascimento de %s é %s\n",
    			      agenda[i].nome, agenda[i].dataNascimento);			        
			    }

			}
			if(fichas_existentes == 0)
				printf("A base de dados está vazia!\n");
		}
		if(opcao[0] == '4') //update
		{
			char procurado[40];
			printf("\nEntre com o nome que você quer alterar(update) os dados:");
			gets(procurado);
			char resp[10];
			
			int i = procurar(procurado, agenda, fichas_existentes);
    	    printf("\n\nO nome é %s. Você quer alterá-lo?(S/N)",
    			      agenda[i].nome);
    		gets(resp);
    		if(resp[0] == 's' || resp[0] == 'S'){
        		printf("\nEntre com um nome:");
			    gets(agenda[i].nome);
    		}
    		
    	    printf("\n\nO telefone de %s é %s. Você quer alterá-lo?(S/N)",
    			      agenda[i].nome, agenda[i].telefone);
    		gets(resp);
    		if(resp[0] == 's' || resp[0] == 'S'){
    			printf("\nEntre com um telefone:");
    			gets(agenda[i].telefone);
    		}	      
    			      
    	    printf("\nO endereço de %s é %s. Você quer alterá-lo?(S/N)",
    			      agenda[i].nome, agenda[i].endereco);
    		gets(resp);
    		if(resp[0] == 's' || resp[0] == 'S'){
    			printf("\nEntre com um endereço:");
    			gets(agenda[i].endereco);
    		}	      
    			      
    		printf("\nO email de %s é %s. Você quer alterá-lo?(S/N)",
    			      agenda[i].nome, agenda[i].email);
    		gets(resp);
    		if(resp[0] == 's' || resp[0] == 'S'){
    			printf("\nEntre com um e-mail:");
    			gets(agenda[i].email);
    		}	      
    			      
    		printf("\nA data de nascimento de %s é %s. Você quer alterá-la?(S/N)",
    			      agenda[i].nome, agenda[i].dataNascimento);
    		gets(resp);
    		if(resp[0] == 's' || resp[0] == 'S'){
    			printf("\nEntre com uma data de nascimento:");
    			gets(agenda[i].dataNascimento);
    		}
    		
    	    printf("\nUpdate concluido!!\n");
			
			
		}
		if(opcao[0] == '5') //excluir	
		{
			char procurado[40];
			printf("\nEntre com o nome que sera excluído:");
			gets(procurado);

			int i = procurar(procurado, agenda, fichas_existentes);
			
			if(i >= 0 && agenda[i].ativo == true){
			    printf("\n\nO telefone: %s, endereço: %s, email: %s, data de nascimento: %s, de %s, será removido\n", agenda[i].telefone, agenda[i].endereco, 
			                                                                                                          agenda[i].email, agenda[i].dataNascimento, agenda[i].nome);
                agenda[i].ativo = false;			                                                                                                          
			    
			}
			else printf("\n\nNome não encontrado\n");
		}
	}
	return 0;
}