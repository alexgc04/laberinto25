"
interfaz estados de la puerta
"
Class {
	#name : #EstadoPuerta,
	#superclass : #Object,
	#category : #'JuegoLaberinto-Laberinto'
}

{ #category : #'as yet unclassified' }
EstadoPuerta >> abrir:unaPuerta [
	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
EstadoPuerta >> cerrar:unaPuerta [
	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
EstadoPuerta >> entrar:alguien puerta:unaPuerta [
	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
EstadoPuerta >> estaAbierta [ 
	^false
]
