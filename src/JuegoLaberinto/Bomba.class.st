Class {
	#name : #Bomba,
	#superclass : #Decorator,
	#instVars : [
		'activa'
	],
	#category : #'JuegoLaberinto-Laberinto'
}

{ #category : #accessing }
Bomba >> activa [

	^ activa
]

{ #category : #accessing }
Bomba >> activa: anObject [

	activa := anObject
]

{ #category : #caminar }
Bomba >> entrar [ 	
	self activa ifTrue:[ Transcript show:'Te has chocado con una bomba';cr. ]
	ifFalse:[self em entrar]
]

{ #category : #initialization }
Bomba >> initialize [ 
	activa:=false.
]
