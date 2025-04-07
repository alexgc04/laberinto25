"
estado es la interfaz de estados del ente (vivo, muerto)
"
Class {
	#name : #EstadoEnte,
	#superclass : #Object,
	#category : #'JuegoLaberinto-Laberinto'
}

{ #category : #'as yet unclassified' }
EstadoEnte >> actua:unBicho [
	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
EstadoEnte >> atacar:alguien [
	self subclassResponsibility 
]
