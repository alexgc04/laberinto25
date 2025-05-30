from ElementoMapa import ElementoMapa

class Hoja(ElementoMapa):

    def __init__(self):
        super().__init__()

    def esTunel(self):
        return False
    
    def __str__(self):
        return "Hoja"