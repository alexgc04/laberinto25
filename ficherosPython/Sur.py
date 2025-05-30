from Orientacion import Orientacion

class Sur(Orientacion):
    
    _instance = None

    def __new__(cls):
        if cls._instance is None:
            cls._instance = super().__new__(cls)
        return cls._instance

    def caminar(self, unBicho):
        pos = unBicho.posicion
        pos.irAlSur(unBicho)

    def ponerElemento(self, unEM, unContenedor):
        unContenedor.sur = unEM

    def obtenerElementoOrEn(self, unContenedor):
        return unContenedor.sur
    
    def recorrer(self, unBloque, unContenedor):
        unContenedor.sur.recorrer(unBloque)

    def calcularPosicionDesde(self, unaForma):
        unPunto = (unaForma.punto.x, unaForma.punto.y + 1)
        unaForma.sur.calcularPosicionDesde(unaForma, unPunto)

    def __str__(self):
        return f"Sur"