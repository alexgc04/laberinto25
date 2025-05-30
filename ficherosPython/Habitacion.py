from Contenedor import Contenedor

class Habitacion(Contenedor):

    def __init__(self):
        super().__init__()
        self.num = None
    
    def esHabitacion(self):
        return True

    def __str__(self):
        return f"Habitacion {self.num}"
    
    def visitarContenedor(self, unVisitor):
        unVisitor.visitarContenedor(self)