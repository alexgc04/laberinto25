"
estado del ente con vidas >0
"
Class {
	#name : #Vivo,
	#superclass : #EstadoEnte,
	#category : #'JuegoLaberinto-Laberinto'
}

{ #category : #'as yet unclassified' }
Vivo >> actua:unBicho [
	unBicho puedeActuar 
]

{ #category : #'as yet unclassified' }
Vivo >> atacar:alguien [
	alguien puedeAtacar
]
