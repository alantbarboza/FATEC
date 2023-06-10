getwd() #ver o diretorio
setwd("C:/Users/aluno/Downloads/sistinR") #insere o novo diretorio

basepre = read.csv('arqpreproipi11.csv')
str(basepre) #mostra o tipo de variaveis

install.packages('RODBC')

library(RODBC)

con2 = odbcDriverConnect("driver={SQL Server}; server=L3M10\\SQLEXPRESS;database=teste;
                         uid=sa;pwd=123456789")

#Lendo dados no R usando a biblioteca  RODBC.  
basepre1 = sqlQuery (con2,'select * from alunoipi')

#mostra dimensões, tipo do dado e o dado
dim(basepre)
str(basepre)
basepre


#vendo linhas e colunas
#média,mediana,máximo e mínimo
basepre[c(1,2,3,4), c(1,2)]
names(basepre) #nome das colunas
mean(basepre$salário)
median(basepre$salário)
max(basepre$salário)
min(basepre$salário)

#mostra dados estatísticos
summary(basepre)

#seleção horizontal
basepre1 = basepre[1:40,]
basepre1
dim(basepre)

#seleção vertical
basepre1 = basepre[,2:6]
dim(basepre1)

#Idade com valores  menores que 0 
basepre[basepre$idade< 0, ]

# Tratando a inconsistência -> atribui a media 
basepre1=basepre
basepre1[1,]
basepre1$idade
basepre1$idade=ifelse(basepre$idade < 0, 
                      mean(ifelse(basepre$idade > 0,basepre$idade,0),
                           na.rm = TRUE), basepre$idade)
basepre[c(16,22,27),c(1,2)]
basepre1[c(16,22,27),c(1,2)]

# -> atribui NULL 
basepre1=basepre
basepre1$idade=ifelse(basepre1$idade < 0, NA, basepre1$idade)
basepre[c(16,22,27),c(1,2)]
basepre1[c(16,22,27),c(1,2)]

#Limpeza - valores desconhecidos 
basepre1=basepre[!is.na(basepre$idade), ]
basepre1[1,]

# seleção de valores - arredondamento - contínuo para inteiro
rm (basepre1)
basepre1=basepre
basepre1$salario = as.integer(basepre1$salário)
sort(basepre1$salário)

#outlier - salario - elimina da base
sort(basepre$salário)
boxplot (basepre$salário)

#Escalonamento/normalização
a=scale(basepre[, 2:3])
a[1:5,]
basepre [1:5,2:3]

#Divisão entre treinamento e teste
library(caTools)
install.packages('caTools')

set.seed(1)
basepre$compra
parte = sample.split(basepre$compra, SplitRatio = 0.75)
parte
basepretreinamento = subset(basepre, parte == TRUE)
basepreteste = subset(basepre, parte == FALSE)
nrow(basepre)
nrow(basepreteste)
nrow(basepretreinamento)

#Codificação: transforma catagorica para numérica 
basepre$regiao
table (basepre$regiao)
unique(basepre$regiao)
factor(basepre$regiao,levels =c('norte', 'sul','nordeste'), labels = c(0,1,2) ) 

#Visualização 1
dev.off()
par (mfrow=c(1,1))
example(pie)
basepre$regiao
table(basepre$regiao) 
percent=table(basepre$regiao) /sum(table(basepre$regiao)) * 100
rm (rotulo)
rotulo=names(table(basepre$regiao))
rotulo=paste(rotulo,percent)
rotulo=paste(rotulo, ' %')   
pie(table(basepre$regiao), rotulo, 
    col = c("purple", "violetred1", "green3"))

#Visualização 2
basepre1=basepre
basepre1$idade=ifelse(basepre$idade < 0, 30, basepre$idade)
basepre1$idade=ifelse(is.na(basepre1$idade), 30, basepre1$idade)

basepre1[c(1,16,22,27),c(1,3)]
hist (basepre1$idade, col="red", main="Histograma das Idades", xlab="Idade",
      ylab = "Frequência", cex.main=0.95)

#visualização 3
plot(basepre1$idade, basepre1$salário,
     xlab='idade', ylab='salario', type="p", pch=1, col = 'red', bg='red',main="Salário x Idade" ) 





########################################################
#Exercício 15.05.23
#1.Eleger tabela(s) para o preprocessamento usando o projeto do curso.
basepre = sqlQuery (con2,'select * from clientemipi')
str(basepre)

#2.Mostrar 2 inconsistências.
basepre1=basepre
basepre1[1,]
basepre1$idade
basepre1$idade=ifelse(basepre$idade < 0, 
                      mean(ifelse(basepre$idade > 0,basepre$idade,0),
                           na.rm = TRUE), basepre$idade)
basepre[c(16,22,27),c(1,2)]
basepre1[c(16,22,27),c(1,2)]


#3.Exibir 2 gráficos.
#######grafico 1
basepre1=basepre
basepre1$idade=ifelse(basepre$idade < 0, 30, basepre$idade)
basepre1$idade=ifelse(is.na(basepre1$idade), 30, basepre1$idade)

basepre1[c(1,16,22,27),c(1,3)]
hist (basepre1$idade, col="red", main="Histograma das Idades", xlab="Idade",
      ylab = "Frequência", cex.main=0.95)

#######grafico 2
plot(basepre1$idade, basepre1$rendamensal_cli,
     xlab='idade', ylab='rendamensal_cli', type="p", pch=1, col = 'red', bg='red',main="rendamensal_cli x Idade" ) 


#4.Mostrar estatística descritiva. 
summary(basepre)
#####################################################


#22.05.23
#fechando a conexão anterior
odbcClose(con2)

# Exemplo - clusters - iris
library(RODBC)

con2 = odbcDriverConnect("driver={SQL Server}; server=L3M10\\SQLEXPRESS;database=teste;
                         uid=sa;pwd=123456789")

dadosiris = iris
dadosiris
class(dadosiris)
str(dadosiris)
length(dadosiris)
dim(dadosiris)
#header = FALSE
write.csv(iris, file="irisipi.csv")
dadosirisa=read.csv(file="irisipi.csv")
dadosirisa

# gera tabela no SQL Server
iristable=data.frame (dadosiris,stringsAsFactors=FALSE)
sqlSave(con2, iristable, rownames=FALSE, safer=FALSE) 

dadosirisa = sqlQuery(con2,"select [SepalLength], [SepalWidth] from
iristable")
summary(dadosirisa)
dadosirisa
dim(dadosirisa)
dim(dadosiris)

#executa o algoritmo kmeans
set.seed(1)
modelokm = kmeans(x = dadosirisa, centers = 3)
modelokm

#obtém o cluster (vetor)
previsaokm = modelokm$cluster
previsaokm

#biblioteca para visualizar
library(cluster)

#cluster1: clusplot(dadosirisa, previsaokm, color = TRUE)
clusplot(dadosirisa,previsaokm,
         xlab='Sepal.Length', ylab='Sepal.Width', main='Agrupamento',color=TRUE)

#cluster 2: colocando os registros dentro do cluster
clusplot(dadosirisa,previsaokm,
         xlab='Sepal.Length', ylab='Sepal.Width', main='agrupamento', color=TRUE, line=0,
         labels=2)

#cluster 3
clusplot(dadosiris, previsaokm, color = TRUE)

#medida de erro
table(dadosiris$Species, previsaokm)

#Medidas
modelokm$withinss
modelokm$tot.withinss
modelokm$betweenss
modelokm$totss

#plot dos pontos
plot(dadosirisa,col=previsaokm)

###################################################
#exercicio 22.05.23
setwd("C:/Users/aluno/Downloads/sistinR")

library(RODBC)

con2 = odbcDriverConnect("driver={SQL Server}; server=L3M10\\SQLEXPRESS;database=teste;
                         uid=sa;pwd=123456789")

basepre = read.csv('kmexemplo.csv')
str(basepre) 

set.seed(1)
modelokm = kmeans(x = basepre, centers = 2)
modelokm

previsaokm = modelokm$cluster
previsaokm

library(cluster)

clusplot(basepre,previsaokm,
         xlab='salario', 
         ylab='idade ', 
         main='Agrupamento',
         color=TRUE)

clusplot(basepre,previsaokm,
         xlab='salario', 
         ylab='idade ', 
         main='Agrupamento',
         color=TRUE, line=0,
         labels=2)

clusplot(basepre, previsaokm, color = TRUE)

table(basepre$compra, previsaokm)
###################################################

