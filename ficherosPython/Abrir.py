from Comando import Comando

class Abrir(Comando):
    
    def __init__(self, receptor=None):
        super().__init__(receptor)

    def ejecutar(self, alguien):
        self.receptor.abrir()