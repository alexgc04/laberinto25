class VisitorInventario:
    def visitarArmario(self, armario):
        print(f"{armario} ha sido visitado por el inventario")

    def visitarPuerta(self, puerta):
        print(f"{puerta} ha sido visitada por el inventario")

    def visitarTunel(self, tunel):
        print(f"{tunel} ha sido visitado por el inventario")

    def visitarPared(self, pared):
        print(f"{pared} ha sido visitada por el inventario")

    def visitarHabitacion(self, habitacion):
        print(f"{habitacion} ha sido visitada por el inventario")