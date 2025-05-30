from Decorator import Decorator

class Bomba(Decorator):
    
    def entrar(self,alguien):
        if self.activa:
            print(f"{alguien} se metió una bomba en la cara")
        else:
            self.em.entrar(alguien)

    def esBomba(self):
        return True

    def __init__(self):
        super().__init__()
        self.activa = False

    def __str__(self):
        return f"Bomba {self.activa}"
    
    def aceptar(self, unVisitor):
        unVisitor.visitarBomba(self)

    def activar(self):
        self.activa = True
        print("Bomba activada")