from Forma import Forma

class Cuadrado(Forma):

    def __init__(self):
        super().__init__()
        self.norte = None 
        self.este = None
        self.sur = None
        self.oeste = None

    def irAlEste(self, unEnte):
        self.este.entrar(unEnte)

    def irAlNorte(self, unEnte):
        self.norte.entrar(unEnte)

    def irAlOeste(self, unEnte):
        self.oeste.entrar(unEnte)

    def irAlSur(self, unEnte):
        self.sur.entrar(unEnte)

    def __str__(self):
        return f"Cuadrado"

    