Class {
	#name : #Pared,
	#superclass : #ElementoMapa,
	#category : #'JuegoLaberinto-Laberinto'
}

{ #category : #caminar }
Pared >> entrar [ 
	Transcript show:'Te has chocado con la pared';cr.
]

{ #category : #'as yet unclassified' }
Pared >> esPared [ 
	^true
]
