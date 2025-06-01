class Acompañante:

    def esAgresivo(self):
        return False

    def esPerezoso(self):
        return False

    def esCurativo(self):
        return False

    def esAcompañante(self):
        return True

    def __str__(self):
        return "Acompañante"

    def actua(self, bicho):
        # Sigue al personaje y ayuda a atacar bichos enemigos en la misma habitación
        bicho.posicion = bicho.juego.person.posicion
        print(f"{bicho} acompaña a {bicho.juego.person} en {bicho.posicion}")
        enemigos = [otro for otro in bicho.juego.bichos if otro != bicho and otro.posicion == bicho.posicion and not otro.modo.esAcompañante() and not otro.modo.esCurativo() and otro.estaVivo()]
        for enemigo in enemigos:
            enemigo.vidas -= 2
            print(f"{bicho} ayuda atacando a {enemigo}. Vidas restantes: {enemigo.vidas}")

    def buscarTunelBicho(self, bicho):
        # No hace nada especial
        pass