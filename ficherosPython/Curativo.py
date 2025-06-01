class Curativo:
    def esAgresivo(self):
        return False

    def esPerezoso(self):
        return False

    def esCurativo(self):
        return True

    def esAcompaniante(self):
        return False

    def __str__(self):
        return "Curativo"

    def actua(self, bicho):
        # Cura al personaje si está en la misma habitación
        if bicho.posicion == bicho.juego.person.posicion:
            bicho.juego.person.vidas += 10
            print(f"{bicho} cura a {bicho.juego.person}. Vidas: {bicho.juego.person.vidas}")
        else:
            print(f"{bicho} espera para curar.")

    def buscarTunelBicho(self, bicho):
        # No hace nada especial
        pass