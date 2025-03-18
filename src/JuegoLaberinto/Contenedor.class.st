"
Contenedor es el composite del laberinto. Es un EM que tiene hijos
"
Class {
	#name : #Contenedor,
	#superclass : #ElementoMapa,
	#instVars : [
		'hijos',
		'orientaciones',
		'este',
		'norte',
		'num',
		'oeste',
		'sur'
	],
	#category : #'JuegoLaberinto-Laberinto'
}

{ #category : #'gestion-hijos' }
Contenedor >> agregarHijo:unEM [
	unEM padre:self.
	self hijos add:unEM
	
]

{ #category : #'gestionar-orientaciones' }
Contenedor >> agregarOrientacion:unaOr [
	self orientaciones add:unaOr.
]

{ #category : #'as yet unclassified' }
Contenedor >> eliminarHijo:unEM [
	self hijos remove:unEM ifAbsent:["no existe ese objeto"]
]

{ #category : #caminar }
Contenedor >> entrar:alguien [
	Transcript show:alguien printString ; nextPutAll:'esta en ' ; nextPutAll:self printString ; cr.
	alguien posicion:self.
]

{ #category : #accessing }
Contenedor >> este [

	^ este
]

{ #category : #accessing }
Contenedor >> este: anObject [

	este := anObject
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
	orientaciones:=OrderedCollection new.
]

{ #category : #accessing }
Contenedor >> norte [

	^ norte
]

{ #category : #accessing }
Contenedor >> norte: anObject [

	norte := anObject
]

{ #category : #accessing }
Contenedor >> num [

	^ num
]

{ #category : #accessing }
Contenedor >> num: anObject [

	num := anObject
]

{ #category : #'gestionar-orientaciones' }
Contenedor >> obtenerElementoOr:unaOr [
	^unaOr obtenerElementoOrEn:self.
]

{ #category : #'gestionar-orientaciones' }
Contenedor >> obtenerOrientacion [ 
	|ind|
	ind :=(1 to:self orientaciones size) atRandom.
	^self orientaciones at:ind.
]

{ #category : #accessing }
Contenedor >> oeste [

	^ oeste
]

{ #category : #accessing }
Contenedor >> oeste: anObject [

	oeste := anObject
]

{ #category : #accessing }
Contenedor >> orientaciones [

	^ orientaciones
]

{ #category : #accessing }
Contenedor >> orientaciones: anObject [

	orientaciones := anObject
]

{ #category : #accessing }
Contenedor >> ponerEnOr:unaOr elemento:unEM [
	"opcion 1: usar if then else"
	"opcion 2: delegar en la orientation"	
	unaOr ponerElemento:unEM en:self.
]

{ #category : #recorrido }
Contenedor >> recorrer:unBloque [
	unBloque value:self.
	self hijos do:[:each | each recorrer:unBloque].
	"tengo que recorrer las orientaciones"
	self orientaciones do:[:each | each recorrer:unBloque contenedor:self].
]

{ #category : #accessing }
Contenedor >> sur [

	^ sur
]

{ #category : #accessing }
Contenedor >> sur: anObject [

	sur := anObject
]
