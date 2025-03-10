Class {
	#name : #Este,
	#superclass : #Orientacion,
	#classVars : [
		'UnicaInstancia'
	],
	#category : #'JuegoLaberinto-Laberinto'
}

{ #category : #accessing }
Este class >> default [
	UnicaInstancia ifNil: [UnicaInstancia:=super new].
	 ^UnicaInstancia 
]

{ #category : #'instance creation' }
Este class >> new [
	self error:'No se puede crear objeto'
]

{ #category : #'as yet unclassified' }
Este >> caminar:unBicho [
	|pos|
	pos := unBicho posicion.
	pos este entrar:unBicho
]

{ #category : #'as yet unclassified' }
Este >> obtenerElementoOrEn:unContenedor [
	^unContenedor este
]

{ #category : #'as yet unclassified' }
Este >> ponerElemento:unEM  en:unContenedor [
	unContenedor este:unEM 
]

{ #category : #recorrido }
Este >> recorrer:unBloque contenedor:unContenedor [
	unContenedor este recorrer:unBloque
]
