numeros_str_ln = '''2.16
18.38
1.28
6.76
18.85
2.84
2.25
4.25
0.27
9.59
4.22
0.18
5.31
3.63'''
# lista numeros


def list_numeros(numeros: str):
    numeros_str = numeros_str_ln.split('\n')
    numeros = []
    for ns in numeros_str:
        numeros.append(float(ns))
    return numeros

# calular total


def total(list_numeros):
    total: float = 0
    for n in list_numeros:
        total += n
    return total


def porcentajes(list_numeros):
    porcentajes = []
    for n in list_numeros:
        porcentajes.append(n/total*100)
    return porcentajes

def total_porcentajes(porcentajes):
    total = 0
    for p in porcentajes:
        total += p
    return total


list_numeros = list_numeros(numeros_str_ln)
total = total(list_numeros)
""" total porcentual """
porcentajes = porcentajes(list_numeros)
total_porcentajes = total_porcentajes(porcentajes)
print(total_porcentajes)