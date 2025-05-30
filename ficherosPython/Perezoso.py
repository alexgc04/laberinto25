import time
from Modo import Modo

class Perezoso(Modo):
    
    def dormir(self, unBicho):
        print(f"{unBicho} duerme")
        time.sleep(3)

    def __init__(self):
        super().__init__()

    def esPerezoso(self):
        return True
    
    def __str__(self):
        return "Perezoso"