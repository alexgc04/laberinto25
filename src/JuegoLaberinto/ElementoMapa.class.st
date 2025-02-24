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

{ #category : #accessing }
ElementoMapa >> padre [

	^ padre
]

{ #category : #accessing }
ElementoMapa >> padre: anObject [

	padre := anObject
]
