Class {
	#name : #LaberintoTest,
	#superclass : #TestCase,
	#instVars : [
		'juego'
	],
	#category : #'JuegoLaberinto-Pruebas'
}

{ #category : #accessing }
LaberintoTest >> juego [

	^ juego
]

{ #category : #accessing }
LaberintoTest >> juego: anObject [

	juego := anObject
]

{ #category : #running }
LaberintoTest >> setUp [
	| fm |
	super setUp.

	juego:=Juego new.
	
	fm:=Creator new.
	juego crearLaberinto2HabitacionesFM: fm.
]

{ #category : #tests }
LaberintoTest >> testHabitaciones [

	|hab1 hab2 pt12 norte sur este oeste fm |
	
	norte:=fm fabricarNorte.
	sur:=fm fabricarSur.
	oeste:=fm fabricarOeste.
	este:=fm fabricarEste.
	hab1:=self juego obtenerHabitacion: 1.
	hab2:=self juego obtenerHabitacion: 2.
	
	self assert:hab1 esHabitacion. "hab1 class = Habitacion"
	self assert:hab2 esHabitacion.
	
	self assert: (hab1 obtenerElementoOr:norte) esPared. 
	self assert: (hab1 obtenerElementoOr:este) esPared.
	self assert: (hab1 obtenerElementoOr:oeste) esPared.
	
	self assert: (hab2 obtenerElementoOr:sur) esPared. 
	self assert: (hab2 obtenerElementoOr:este) esPared.
	self assert: (hab2 obtenerElementoOr:oeste) esPared.
	"hab1 obtenerElementoOr:norte. norte varb temporal"
	"..."	
	
	pt12:=hab1 obtenerElementoOr:sur. "hab1 obtenerElementoOr:sur"
	self assert:pt12 esPuerta.
	self assert: (hab2 obtenerElementoOr:norte) esPuerta.
	self assert:pt12 abierta not.
	self assert:pt12 equals:(hab2 obtenerElementoOr:norte).
	

]

{ #category : #tests }
LaberintoTest >> testIniciales [

	| numHab |
	self assert:self juego notNil.
	self assert:self juego laberinto notNil.
	numHab:=self juego laberinto hijos size. "self juego obtenerNumHab"
	self assert:numHab equals: 2.


]
