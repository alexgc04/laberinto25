Class {
	#name : #Norte,
	#superclass : #Orientacion,
	#classVars : [
		'UnicaInstancia'
	],
	#category : #'JuegoLaberinto-Laberinto'
}

{ #category : #accessing }
Norte class >> default [
	UnicaInstancia ifNil: [UnicaInstancia:=super new].
	 ^UnicaInstancia 
]

{ #category : #'instance creation' }
Norte class >> new [
	self error:'No se puede crear objeto'
]

{ #category : #'as yet unclassified' }
Norte >> calcularPosicionDesde: unaForma [
	| unPunto |
	unPunto := (unaForma punto x) @ (unaForma punto y-1).
	unaForma este calcularPosicionDesde: unaForma en: unPunto

]

{ #category : #'as yet unclassified' }
Norte >> caminar:unBicho [
	|pos|
	pos := unBicho posicion.
	pos irAlNorte:unBicho
]

{ #category : #'as yet unclassified' }
Norte >> obtenerElementoOrEn:unContenedor [
	^unContenedor norte 
	

]

{ #category : #'as yet unclassified' }
Norte >> ponerElemento:unEM  en:unContenedor [
	unContenedor norte:unEM 
]

{ #category : #recorrido }
Norte >> recorrer:unBloque contenedor:unContenedor [
	unContenedor norte recorrer:unBloque
]
