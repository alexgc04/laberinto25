from Director import Director
from Juego import Juego
from BichoCurativo import BichoCurativo
from BichoAcompañante import BichoAcompañante

def comprobar_fin_juego(juego):
    if not juego.person.estaVivo():
        print("¡Fin del juego! El personaje ha muerto. Has perdido.")
        exit(0)
    enemigos = [b for b in juego.bichos if not isinstance(b, (BichoCurativo, BichoAcompañante))]
    if all(not b.estaVivo() for b in enemigos):
        print("¡Fin del juego! No quedan bichos enemigos vivos. ¡Has ganado!")
        exit(0)

def main():
    # Ruta al JSON (ajusta según tu estructura)
    ruta = r"C:\Users\Alex gc\Desktop\3 CURSO INFORMATICA\2nd cuatri TERCERO\Diseño de software\COSAS CLASE Star UML\labLnuevo.json"

    director = Director()
    director.procesar(ruta)
    juego = director.obtenerJuego()

    print(juego)

    juego.agregarPersonaje("Alejandro")
    juego.lanzarBichos()
    comprobar_fin_juego(juego)
    juego.terminarBichos()
    comprobar_fin_juego(juego)

    person = juego.person
    lista = person.obtenerComandos()  # Si tienes este método
    if lista and len(lista) > 1:
        lista[1].ejecutar(person)
        comprobar_fin_juego(juego)

    hab1 = juego.obtenerHabitacion(1)
    hab2 = juego.obtenerHabitacion(2)
    if hab2.hijos:
        tunerl = hab2.hijos[0]
        # ...lo que quieras hacer con tunerl...
    else:
        print("Habitación 2 no tiene hijos.")

    bicho = juego.bichos[0]
    person = juego.person

    hab1.entrar(bicho)
    hab1.entrar(person)
    comprobar_fin_juego(juego)

    # Buscar tunel en la posición del bicho
    unBicho = juego.bichos[0]
    unCont = unBicho.posicion
    tunel = next((each for each in unCont.hijos if each.esTunel()), None)
    if tunel:
        tunel.entrar(unBicho)
        comprobar_fin_juego(juego)

    print("Vidas antes:", person.vidas)
    person.atacar()
    comprobar_fin_juego(juego)
    print("Vidas después:", person.vidas)

    if hab1.hijos:
        arm = hab1.hijos[0]
        arm.entrar(person)
        hab1.entrar(person)
        comprobar_fin_juego(juego)

    person.irAlNorte()
    comprobar_fin_juego(juego)
    person.irAlSur()
    comprobar_fin_juego(juego)
    person.irAlEste()
    comprobar_fin_juego(juego)
    person.irAlOeste()
    comprobar_fin_juego(juego)

    juego.abrirPuertas()
    juego.cerrarPuertas()
    juego.activarBombas()
    juego.desactivarBombas()
    comprobar_fin_juego(juego)

    # Abre y muestra todas las puertas
    juego.laberinto.recorrer(lambda each: (each.abrir() if each.esPuerta() else None, print(each) if each.esPuerta() else None))

    ba1 = juego.bichos[0]
    print(ba1.posicion)
    ba1.actua()
    comprobar_fin_juego(juego)
    print(ba1.estaVivo())
    ba1.vidas = 10

    juego.lanzarBicho(ba1)
    comprobar_fin_juego(juego)
    juego.terminarBicho(ba1)
    comprobar_fin_juego(juego)

if __name__ == "__main__":
    main()