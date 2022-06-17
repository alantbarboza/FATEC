3 Escreva uma hierarquia de classes para representar animais. Deve haver uma classe
Animal que define o nome e a quantidade de patas do animal. Ela deve ter três
construtores: o padrão, um que recebe uma string a ser atribuída ao nome do animal e
um terceiro que recebe o número de patas e o nome. Escreva uma classe chamada
Mamifero que herda de Animal. Ela deve ter um construtor somente. Ele recebe o
nome e a quantidade de patas do Animal e os repassa para o construtor da superclasse.
Escreva duas classes chamadas Cachorro e Gato que herdam de Mamifero. Ambas
definem um único construtor que recebe o nome do Animal e repassa para a
superclasse. Internamente, ambos devem repassar o valor 4 como quantidade de patas.

4 Escreva uma classe de Teste que instancia um Cachorro e um Gato.