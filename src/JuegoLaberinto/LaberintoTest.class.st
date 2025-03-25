Class {
	#name : #LaberintoTest,
	#superclass : #TestCase,
	#instVars : [
		'juego',
		'fm'
	],
	#category : #'JuegoLaberinto-Pruebas'
}

{ #category : #accessing }
LaberintoTest >> fm [

	^ fm
]

{ #category : #accessing }
LaberintoTest >> fm: anObject [

	fm := anObject
]

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
	super setUp.

	juego:=Juego new.
	
	fm:=Creator new.
	juego crearLaberinto2HabitacionesFM: fm.
]

{ #category : #tests }
LaberintoTest >> testHabitaciones [
|hab1 hab2 pt12 norte sur este oeste|
	
	norte:=fm fabricarNorte.
	sur:=fm fabricarSur.
	este:=fm fabricarEste.
	oeste:=fm fabricarOeste.
	
	hab1:=self juego obtenerHabitacion:1.
	hab2:=self juego obtenerHabitacion:2.
	
	self assert:hab1 esHabitacion. 
	self assert:hab2 esHabitacion.
	
 "hab1 obtenerElementoOr:norte. norte variable temporal"
	"..."
	self assert: (hab1 obtenerElementoOr:norte) esPared.
	self assert: (hab1 obtenerElementoOr:este) esPared.
	self assert: (hab1 obtenerElementoOr:oeste) esPared.

	self assert: (hab2 obtenerElementoOr:sur) esPared.
	self assert: (hab2 obtenerElementoOr:este) esPared.
	self assert: (hab2 obtenerElementoOr:oeste) esPared.
	
	pt12:=hab1 obtenerElementoOr:sur. "hab1 obtenerElementoOr:sur"
	self assert:pt12 esPuerta.
	self assert:(hab2 obtenerElementoOr:norte)  esPuerta.
	self assert:pt12 abierta not.

]

{ #category : #tests }
LaberintoTest >> testIniciales [

	| numHab |
	self assert:self juego notNil.
	self assert:self juego laberinto notNil.
	numHab:=self juego laberinto hijos size. "self juego obtenerNumHab"
	self assert:numHab equals: 2.


]
