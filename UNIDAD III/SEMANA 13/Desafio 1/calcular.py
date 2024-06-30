a = '''14280.65
121037.70
8448.95
44550.51
124170.33
18702.50
14840.65
28024.70
1816.60
63151.98
27832.60
1207.85
34970.10
23959.05
700.00
47905.80
12087.10
8053.05
28171.23
27192.65
7284.75'''

def list_numeros(numeros: str):
    numeros_str = numeros.split('\n')
    numeros = []
    for ns in numeros_str:
        numeros.append(float(ns))
    return numeros

def total(list_numeros):
    total: float = 0
    for n in list_numeros:
        total += n
    return total
print(total(list_numeros(a)))