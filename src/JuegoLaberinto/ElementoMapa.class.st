Class {
	#name : #ElementoMapa,
	#superclass : #Object,
	#instVars : [
		'padre'
	],
	#category : #'JuegoLaberinto-Laberinto'
}

{ #category : #caminar }
ElementoMapa >> entrar [
	"deberemos indicar quien entra"
	self subclassResponsibility 	


]

{ #category : #caminar }
ElementoMapa >> entrar:alguien [
	"deberemos indicar quien entra"
	self subclassResponsibility 	


]

{ #category : #'as yet unclassified' }
ElementoMapa >> esHabitacion [
	^false
]

{ #category : #'as yet unclassified' }
ElementoMapa >> esLaberinto [
	^false
]

{ #category : #'as yet unclassified' }
ElementoMapa >> esPared [
	^false
]

{ #category : #'as yet unclassified' }
ElementoMapa >> esPuerta [
	^false
]

{ #category : #accessing }
ElementoMapa >> padre [

	^ padre
]

{ #category : #accessing }
ElementoMapa >> padre: anObject [

	padre := anObject
]

{ #category : #recorrido }
ElementoMapa >> recorrer:unBloque [
	self subclassResponsibility 
]
