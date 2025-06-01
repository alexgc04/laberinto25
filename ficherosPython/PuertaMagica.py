class PuertaMagica:
    def __init__(self, puerta, destino):
        self.puerta = puerta
        self.destino = destino  # número de la habitación destino

    def abrir(self, personaje):
        print("¡Puerta mágica abierta! Teletransporte activado.")
        personaje.posicion = self.destino
        print(f"{personaje} ha sido teletransportado a la habitación {self.destino}")
        self.puerta.abrir()  # Llama al método original si es necesario

    def __str__(self):
        return f"PuertaMagica({self.puerta})"