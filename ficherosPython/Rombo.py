from Forma import Forma

class Rombo(Forma):
    
    def __init__(self):
        super().__init__()
        self.noreste = None
        self.sureste = None
        self.suroeste = None
        self.noroeste = None