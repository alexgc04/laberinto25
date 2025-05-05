"
vista grafica del juego

Internal Representation and Key Implementation Points.

    Instance Variables
	alto:		<Object>
	ancho:		<Object>
	bichosM:		<Object>
	juego:		<Object>
	mAP:		<Object>
	mCP:		<Object>
	mLB:		<Object>
	person:		<Object>
	personM:		<Object>
	vidasM:		<Object>
	win:		<Object>


    Implementation Points
"
Class {
	#name : #LaberintoGUI,
	#superclass : #BorderedMorph,
	#instVars : [
		'juego',
		'win',
		'person',
		'ancho',
		'alto',
		'vidasM',
		'mAP',
		'mCP',
		'mLB',
		'personM',
		'bichosM'
	],
	#category : #'JuegoLaberinto-Vista'
}

{ #category : #accessing }
LaberintoGUI >> alto [

	^ alto
]

{ #category : #accessing }
LaberintoGUI >> alto: anObject [

	alto := anObject
]

{ #category : #accessing }
LaberintoGUI >> ancho [

	^ ancho
]

{ #category : #accessing }
LaberintoGUI >> ancho: anObject [

	ancho := anObject
]

{ #category : #accessing }
LaberintoGUI >> bichosM [

	^ bichosM
]

{ #category : #accessing }
LaberintoGUI >> bichosM: anObject [

	bichosM := anObject
]

{ #category : #'as yet unclassified' }
LaberintoGUI >> calcularPosicion [
	|h1|
	self juego ifNil:[	^self].
	h1:=self juego obtenerHabitacion:1.
	h1 punto:0@0.	
	h1 calcularPosicion.

]

{ #category : #'as yet unclassified' }
LaberintoGUI >> iniciarJuego [
	|director|
		director:=Director new procesar: 'C:\Users\Alex gc\Desktop\3 CURSO INFORMATICA\2nd cuatri TERCERO\Diseño de software\COSAS CLASE Star UML\laberinto4hab4bichos.json'.
		self juego:director obtenerJuego.
		self mostrarLaberinto.
		win:=self openInWindowLabeled:'LaberintoGUI'.
		self agregarPersonaje:'Pepín'. "el nombre se podría introducir desde la interfaz"
		self dibujarLaberinto.
]

{ #category : #accessing }
LaberintoGUI >> juego [

	^ juego
]

{ #category : #accessing }
LaberintoGUI >> juego: anObject [

	juego := anObject
]

{ #category : #accessing }
LaberintoGUI >> mAP [

	^ mAP
]

{ #category : #accessing }
LaberintoGUI >> mAP: anObject [

	mAP := anObject
]

{ #category : #accessing }
LaberintoGUI >> mCP [

	^ mCP
]

{ #category : #accessing }
LaberintoGUI >> mCP: anObject [

	mCP := anObject
]

{ #category : #accessing }
LaberintoGUI >> mLB [

	^ mLB
]

{ #category : #accessing }
LaberintoGUI >> mLB: anObject [

	mLB := anObject
]

{ #category : #'as yet unclassified' }
LaberintoGUI >> mostrarLaberinto [
	self calcularPosicion. "calcula la posición relativa de las habitaciones respecto de la hab1"
	"self normalizar." "traslación de todo el laberinto para que no haya coordenadas negativas"
	"self calcularDimensiones." "repartir el ancho y alto del canvas entre las habitaciones"
	"self asignarPuntosReales." "asigna las posiciones a cada contenedor (forma)"

]

{ #category : #accessing }
LaberintoGUI >> person [

	^ person
]

{ #category : #accessing }
LaberintoGUI >> person: anObject [

	person := anObject
]

{ #category : #accessing }
LaberintoGUI >> personM [

	^ personM
]

{ #category : #accessing }
LaberintoGUI >> personM: anObject [

	personM := anObject
]

{ #category : #accessing }
LaberintoGUI >> vidasM [

	^ vidasM
]

{ #category : #accessing }
LaberintoGUI >> vidasM: anObject [

	vidasM := anObject
]

{ #category : #accessing }
LaberintoGUI >> win [

	^ win
]

{ #category : #accessing }
LaberintoGUI >> win: anObject [

	win := anObject
]
