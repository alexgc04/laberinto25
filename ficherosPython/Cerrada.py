from EstadoPuerta import EstadoPuerta


class Cerrada(EstadoPuerta):
    def abrir(self, unaPuerta):
        from Abierta import Abierta
        unaPuerta.estado = Abierta()
        print(f"{unaPuerta} se ha abierto")

    def cerrar(self, unaPuerta):
        "ya cerrada"

    def entrar(self, alguien, unaPuerta):
        print(f"{alguien} ha chocado con una puerta")

    def __str__(self):
        return "Cerrada"