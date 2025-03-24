Class {
	#name : #ElementoMapa,
	#superclass : #Object,
	#instVars : [
		'padre'
	],
	#category : #'JuegoLaberinto-Laberinto'
}

{ #category : #caminar }
ElementoMapa >> entrar:alguien [
	self subclassResponsibility 	


]

{ #category : #'as yet unclassified' }
ElementoMapa >> esArmario [ 
	^false
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
	unBloque value:self
]
