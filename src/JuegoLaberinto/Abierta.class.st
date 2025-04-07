"
define el estado de la puerta que permite el paso
"
Class {
	#name : #Abierta,
	#superclass : #EstadoPuerta,
	#category : #'JuegoLaberinto-Laberinto'
}

{ #category : #'as yet unclassified' }
Abierta >> abrir:unaPuerta [
	"la puerta ya esta abierta"
]

{ #category : #'as yet unclassified' }
Abierta >> cerrar:unaPuerta [
	Transcript show:unaPuerta printString; nextPutAll: ' cerrada'; cr.
	unaPuerta estado:Cerrada new.
]

{ #category : #'as yet unclassified' }
Abierta >> entrar:alguien puerta:unaPuerta [
	unaPuerta puedeEntrar:alguien


]

{ #category : #'as yet unclassified' }
Abierta >> estaAbierta [ 
	^true
]
