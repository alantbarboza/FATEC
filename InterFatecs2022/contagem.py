tam = int(input())
aux = []
valida, contadora = 0,0
while True:
    num = int(input())
    contadora+=1
    while num != contadora:
        aux.append(contadora)
        contadora+=1
    valida+=1
    if valida >= tam:
        break

if len(aux)>0:
    for i in aux:
        print(i)
else:
    print("bom trabalho")
