Class {
	#name : #ElementoMapa,
	#superclass : #Object,
	#instVars : [
		'padre',
		'comandos'
	],
	#category : #'JuegoLaberinto-Laberinto'
}

{ #category : #comandos }
ElementoMapa >> agregarComando:unComando [
	self comandos add:unComando
]

{ #category : #accessing }
ElementoMapa >> comandos [

	^ comandos
]

{ #category : #accessing }
ElementoMapa >> comandos: anObject [

	comandos := anObject
]

{ #category : #comandos }
ElementoMapa >> eliminarComando:unComando [
	self comandos remove:unComando ifAbsent:["no existe ese objeto"]
]

{ #category : #caminar }
ElementoMapa >> entrar:alguien [
	self subclassResponsibility 	


]

{ #category : #'as yet unclassified' }
ElementoMapa >> esArmario [ 
	^false
]

{ #category : #'as yet unclassified' }
ElementoMapa >> esBomba [
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

{ #category : #'as yet unclassified' }
ElementoMapa >> esTunel [
	^false
]

{ #category : #initialization }
ElementoMapa >> initialize [ 
	 comandos:=OrderedCollection new.
]

{ #category : #comandos }
ElementoMapa >> obtenerComandos [ 
	^self comandos 
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
