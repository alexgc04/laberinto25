from Comando import Comando

class Abrir(Comando):
    
    def __init__(self):
        super.__init__()

    def ejecutar(self, alguien):
        self.receptor.abrir()