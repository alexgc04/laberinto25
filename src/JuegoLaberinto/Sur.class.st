Class {
	#name : #Sur,
	#superclass : #Orientacion,
	#classVars : [
		'UnicaInstancia'
	],
	#category : #'JuegoLaberinto-Laberinto'
}

{ #category : #accessing }
Sur class >> default [
	UnicaInstancia ifNil: [UnicaInstancia:=super new].
	 ^UnicaInstancia 
]

{ #category : #'instance creation' }
Sur class >> new [
	self error:'No se puede crear objeto'
]

{ #category : #'as yet unclassified' }
Sur >> caminar:unBicho [
	|pos|
	pos := unBicho posicion.
	pos irAlSur:unBicho
]

{ #category : #'as yet unclassified' }
Sur >> obtenerElementoOrEn:unContenedor [
	^unContenedor sur
]

{ #category : #'as yet unclassified' }
Sur >> ponerElemento:unEM  en:unContenedor [
	unContenedor sur:unEM 
]

{ #category : #recorrido }
Sur >> recorrer:unBloque contenedor:unContenedor [
	unContenedor sur recorrer:unBloque
]
