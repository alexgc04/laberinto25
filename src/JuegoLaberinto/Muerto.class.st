"
estado del ente con vidas=0
"
Class {
	#name : #Muerto,
	#superclass : #EstadoEnte,
	#category : #'JuegoLaberinto-Laberinto'
}

{ #category : #'as yet unclassified' }
Muerto >> actua:unBicho [
	"los muertos no actuan"
]

{ #category : #'as yet unclassified' }
Muerto >> atacar:alguien [
	"los moridos no atacan"
]
