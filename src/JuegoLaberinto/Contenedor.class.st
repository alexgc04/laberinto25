"
Contenedor es el composite del laberinto. Es un EM que tiene hijos
"
Class {
	#name : #Contenedor,
	#superclass : #ElementoMapa,
	#instVars : [
		'hijos'
	],
	#category : #'JuegoLaberinto-Laberinto'
}

{ #category : #'gestion-hijos' }
Contenedor >> agregarHijo:unEM [
	unEM padre:self.
	self hijos add:unEM
	
]

{ #category : #'as yet unclassified' }
Contenedor >> eliminarHijo:unEM [
	self hijos remove:unEM ifAbsent:["no existe ese objeto"]
]

{ #category : #accessing }
Contenedor >> hijos [

	^ hijos
]

{ #category : #accessing }
Contenedor >> hijos: anObject [

	hijos := anObject
]

{ #category : #initialization }
Contenedor >> initialize [ 
	hijos:=OrderedCollection new.
]
