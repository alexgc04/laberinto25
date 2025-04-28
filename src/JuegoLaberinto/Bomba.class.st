Class {
	#name : #Bomba,
	#superclass : #Decorator,
	#instVars : [
		'activa'
	],
	#category : #'JuegoLaberinto-Laberinto'
}

{ #category : #visitor }
Bomba >> aceptar:unVisitor [
	unVisitor visitarBomba:self
]

{ #category : #accessing }
Bomba >> activa [

	^ activa
]

{ #category : #accessing }
Bomba >> activa: anObject [

	activa := anObject
]

{ #category : #'as yet unclassified' }
Bomba >> activar [
	Transcript show: 'Bomba activa';cr.
	self activa:true
]

{ #category : #caminar }
Bomba >> entrar:alguien [
	self activa ifTrue:[ Transcript show:alguien printString ; nextPutAll: ' ha chocado con una bomba';cr. 
		"explotar, quitar vidas"
		]
	ifFalse:[self em entrar:alguien]
]

{ #category : #'as yet unclassified' }
Bomba >> esBomba [ 
	^true
]

{ #category : #initialization }
Bomba >> initialize [ 
	activa:=false.
]

{ #category : #printing }
Bomba >> printOn:aStream [
	aStream nextPutAll:'Bomba'
]
