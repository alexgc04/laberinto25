Class {
	#name : #Laberinto,
	#superclass : #ElementoMapa,
	#instVars : [
		'habitaciones'
	],
	#category : #'JuegoLaberinto-Laberinto'
}

{ #category : #habitaciones }
Laberinto >> agregar:unaHabitacion [

	self habitaciones add:unaHabitacion
	
]

{ #category : #habitaciones }
Laberinto >> agregarHabitacion:unaHabitacion [

	self habitaciones add:unaHabitacion
	
]

{ #category : #habitaciones }
Laberinto >> eliminarHabitacion:unaHabitacion [
	self habitaciones remove:unaHabitacion ifAbsent:["no existe ese objeto habitacion"]
]

{ #category : #caminar }
Laberinto >> entrar [ 
	"que significa entrar en el laberinto?? entrar en la habitacion 1"
	
]

{ #category : #accessing }
Laberinto >> habitaciones [

	^ habitaciones
]

{ #category : #accessing }
Laberinto >> habitaciones: anObject [

	habitaciones := anObject
]

{ #category : #initialization }
Laberinto >> initialize [ 
	habitaciones:=OrderedCollection new.
]

{ #category : #habitaciones }
Laberinto >> obtenerHabitacion:unNum [
	^self habitaciones detect:[:each | each num = unNum] ifNone:[ nil ]
	
]
