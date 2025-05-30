from EstadoPuerta import EstadoPuerta
from Cerrada import Cerrada

class Abierta(EstadoPuerta):
    def abrir(self, unaPuerta):
        "ya abierta"

    def cerrar(self, unaPuerta):
        unaPuerta.estado = Cerrada()
        print(f"{unaPuerta} se ha cerrado")

    def entrar(self, alguien, unaPuerta):
        unaPuerta.puedeEntrar(alguien)


    def estaAbierta(self):
        return True
    
    def __str__(self):
        return "Abierta"