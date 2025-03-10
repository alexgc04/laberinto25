"
interfaz comun de los entes del juego
"
Class {
	#name : #Ente,
	#superclass : #Object,
	#instVars : [
		'poder',
		'posicion',
		'vidas',
		'juego'
	],
	#category : #'JuegoLaberinto-Laberinto'
}

{ #category : #initialization }
Ente >> initialize [ 
	vidas:=5.
	poder:=1.
]

{ #category : #accessing }
Ente >> juego [

	^ juego
]

{ #category : #accessing }
Ente >> juego: anObject [

	juego := anObject
]

{ #category : #accessing }
Ente >> poder [

	^ poder
]

{ #category : #accessing }
Ente >> poder: anObject [

	poder := anObject
]

{ #category : #accessing }
Ente >> posicion [

	^ posicion
]

{ #category : #accessing }
Ente >> posicion: anObject [

	posicion := anObject
]

{ #category : #accessing }
Ente >> vidas [

	^ vidas
]

{ #category : #accessing }
Ente >> vidas: anObject [

	vidas := anObject
]
