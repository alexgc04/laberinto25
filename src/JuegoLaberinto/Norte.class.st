Class {
	#name : #Norte,
	#superclass : #Orientacion,
	#category : #'JuegoLaberinto-Laberinto'
}

{ #category : #'as yet unclassified' }
Norte >> caminar:unBicho [
	|pos|
	pos := unBicho posicion.
	pos norte entrar:unBicho
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
