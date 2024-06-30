
def calculo(precio: float, cantidad_vendida: float, descuento: float = None) -> None:
    # detalles venta
    descuento = descuento if descuento is not None else 0

    calculo1 = precio * cantidad_vendida - descuento

    calculo2 = precio * cantidad_vendida * (1 - descuento)
    print(calculo1)
    print(calculo2)


def hiPython() -> None:
    print('hola mundo de python')


if __name__ == '__main__':
    hiPython()
