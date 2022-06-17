/*
5) Vamos melhorar mais ainda o código cpf3.c acrescentando agora um procedimento (uma função que nada retorna) para informar (imprimir na tela) o estado de origem do CPF, com base no seu nono dígito (ou seu ante-penúltimo dígito):


    * 0 Rio Grande do Sul
    * 1 Distrito Federal, Goiás, Mato Grosso, Mato Grosso do Sul e Tocantins
    * 2 Amazonas, Pará, Roraima, Amapá, Acre e Rondônia
    * 3 Ceará, Maranhão e Piauí
    * 4 Paraíba, Pernambuco, Alagoas e Rio Grande do Norte
    * 5 Bahia e Sergipe
    * 6 Minas Gerais
    * 7 Rio de Janeiro e Espírito Santo
    * 8 São Paulo
    * 9 Paraná e Santa Catarina
*/
#include<stdio.h>
#include<stdbool.h>
/*
    cpf -> vetor com os dígitos do cpf
    mult -> vetor com os multiplicadores, de tamanho N
    N -> Tamanho do vetor mult e também a quantidade de operações (9 ou 10)
*/
int calculaDigito(int cpf[], int mult[], int N){
    int soma=0, i;
    for(i=0; i<N; i++)
	{	soma = soma + cpf[i]*mult[i];
	}
	return ((soma*10) % 11)%10;
}

/*
    Retorna true se todos os 11 dígitos de um CPF forem iguais, caso contrário,
    retorna false.
*/
bool todosRepetidos(int cpf[]){
    int i;
    for(i=1; i<11; i++)
    {   if(cpf[0]!=cpf[i])
            return false;
    }
    return true;
}

void estadoCPF(nonoDigito){

    char* estado[10] = {"Rio Grande do Sul", 
                        "Distrito Federal, Goiás, Mato Grosso, Mato Grosso do Sul e Tocantins", 
                        "Amazonas, Pará, Roraima, Amapá, Acre e Rondônia", 
                        "Ceará, Maranhão e Piauí",
                        "Paraíba, Pernambuco, Alagoas e Rio Grande do Norte",
                        "Bahia e Sergipe",
                        "Minas Gerais",
                        "Rio de Janeiro e Espírito Santo",
                        "São Paulo",
                        "Paraná e Santa Catarina"};
    
    printf("\nSeu cpf é do estado de %s ", estado[nonoDigito]);
}

int main(){
    int cpf[11];
	int m1[9]={10,9,8,7,6,5,4,3,2};
	int m2[10]={11,10,9,8,7,6,5,4,3,2};
	int i;
	printf("Entre com os 11 digitos do CPF:");
	for(i=0;i<11;i++){
    	scanf("%d", &cpf[i]);
	}
  	
	if(todosRepetidos(cpf) == false &&
	   calculaDigito(cpf, m1, 9) == cpf[9] &&
	   calculaDigito(cpf, m2, 10) == cpf[10]){
	      printf("\nCPF valido.");
	      estadoCPF(cpf[8]);
	   }else{
	     printf("\nErro no CPF.");  
	   } 
	return 0;
}
