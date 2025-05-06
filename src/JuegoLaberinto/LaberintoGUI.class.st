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

{ #category : #acciones }
LaberintoGUI >> abrirPuertas [
	self juego abrirPuertas 
]

{ #category : #'as yet unclassified' }
LaberintoGUI >> agregarPersonaje:unaCadena [
	self juego agregarPersonaje: unaCadena.
	self person:self juego person.
	self person addDependent: self. "attach del Observer sobre el sujeto"

]

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

{ #category : #'as yet unclassified' }
LaberintoGUI >> asignarPuntosReales [

	| x y origen|
	origen:=70@10.
	self juego laberinto hijos do: 
			[:each |
			x := origen x + (each punto x * self ancho).
			y := origen y + (each punto y * self alto).
			each punto: x @ y.
			each extent: self ancho @ self alto.
			
			"each hijos do:[:hijo | hijo asignarPuntosReales:each]"
		]
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
LaberintoGUI >> calcularDimensiones [

	"Este rectangulo delimita el área sobre la que se dibuja el laberinto: 156@44 extent:810@632"

	| maxX maxY |
	maxX := 0.
	maxY := 0.
	"self origen:158@46."
	self juego laberinto hijos do: [ :each | 
		maxX := maxX max: each punto x.
		maxY := maxY max: each punto y ].
	maxX := maxX + 1.
	maxY := maxY + 1.
	self ancho: (1050 / maxX) rounded.
	self alto: (600 / maxY) rounded

]

{ #category : #'as yet unclassified' }
LaberintoGUI >> calcularPosicion [
	|h1|
	self juego ifNil:[	^self].
	h1:=self juego obtenerHabitacion:1.
	h1 punto:0@0.	
	h1 calcularPosicion.

]

{ #category : #dibujar }
LaberintoGUI >> dibujarContenedorRectangular: unaForma escala:unInt [

	| rec unPunto an al |
	unPunto := unaForma punto.
	an := (unaForma extent x)/unInt.
	al := (unaForma extent y)/unInt.
	rec:=BorderedMorph new extent:an@al.
	rec color:Color white.
	rec borderWidth: 2.
	self addMorph:rec.
	rec position:self position+unPunto.

]

{ #category : #dibujar }
LaberintoGUI >> dibujarLaberinto [
	self juego ifNil: [ ^ self ].
	self juego laberinto aceptar: self. "self juego dibujar:self"

	self mostrarVidasPersonaje.
	self mostrarPersonaje.
	self mostrarAbrirPuertas.
	self mostrarLanzarBichos.
	self mostrarDetenerBichos.
	self mostrarVolverAJugar.
	
	
	
	
	

]

{ #category : #'as yet unclassified' }
LaberintoGUI >> handlesKeyDown: anEvent [
	^ true

]

{ #category : #'event handling' }
LaberintoGUI >> handlesMouseDown: anEvent [
	^true

]

{ #category : #'event handling' }
LaberintoGUI >> handlesMouseOver: anEvent [
^ true

]

{ #category : #'as yet unclassified' }
LaberintoGUI >> iniciarJuego [
	|director ruta|
		ruta:= 'C:\Users\Alex gc\Desktop\3 CURSO INFORMATICA\2nd cuatri TERCERO\Diseño de software\COSAS CLASE Star UML\'.
		director:=Director new procesar:ruta, 'laberinto4hab4bichos.json'.
		self juego:director obtenerJuego.
		self mostrarLaberinto.
		win:=self openInWindowLabeled:'LaberintoGUI'.
		self agregarPersonaje:'Pepín'. "el nombre se podría introducir desde la interfaz"
		self dibujarLaberinto.
]

{ #category : #dibujar }
LaberintoGUI >> initialize [ 
	super initialize.
	self extent: 1150@900.
	self borderWidth: 2; useRoundedCorners.
	self color:Color white.
	bichosM:=Dictionary new.

]

{ #category : #accessing }
LaberintoGUI >> juego [

	^ juego
]

{ #category : #accessing }
LaberintoGUI >> juego: anObject [

	juego := anObject
]

{ #category : #'event handling' }
LaberintoGUI >> keyDown: anEvent [
	| key |
	key := anEvent key.
"	Transcript show:key value asString;cr."
	key = KeyboardKey up ifTrue: [ self person irAlNorte ].
	key = KeyboardKey down ifTrue: [ self person irAlSur ].
	key = KeyboardKey right ifTrue: [ self person irAlEste ].
	key = KeyboardKey left ifTrue: [ self person irAlOeste ].
	key value = 65 ifTrue:[self person atacar].

]

{ #category : #acciones }
LaberintoGUI >> lanzarBichos [
	self juego lanzarBichos 
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
LaberintoGUI >> mostrarAbrirPuertas [
	mAP:=SimpleButtonMorph new target:self; label: 'Abrir'; actionSelector: #abrirPuertas.
	self addMorph: mAP.
	mAP position:self position +(5@70).

]

{ #category : #'as yet unclassified' }
LaberintoGUI >> mostrarDetenerBichos [
	
	mLB:=SimpleButtonMorph new target:self; label: 'Detener'; actionSelector: #terminarBichos.
	self addMorph: self mLB.
	self mLB position:self position +(5@160).

]

{ #category : #'as yet unclassified' }
LaberintoGUI >> mostrarLaberinto [
	self calcularPosicion. "calcula la posición relativa de las habitaciones respecto de la hab1"
	self normalizar."traslación de todo el laberinto para que no haya coordenadas negativas"
	self calcularDimensiones. "repartir el ancho y alto del canvas entre las habitaciones"
	self asignarPuntosReales. "asigna las posiciones a cada contenedor (forma)"

]

{ #category : #'as yet unclassified' }
LaberintoGUI >> mostrarLanzarBichos [
	
	mLB:=SimpleButtonMorph new target:self; label: 'Iniciar'; actionSelector: #lanzarBichos.
	self addMorph: self mLB.
	self mLB position:self position +(5@130).

]

{ #category : #'as yet unclassified' }
LaberintoGUI >> mostrarPersonaje [

	| unCont an al a b c d rec |
	self person ifNil: [ ^ self ].
	unCont := self person posicion.
	an := unCont extent x.
	al := unCont extent y.
	a := unCont punto x + (an // 2).
	b := unCont punto y + (al // 2).
	c := an // 9.
	d := al // 8.
	self personM ifNil: [
		rec := BorderedMorph new extent: c @ d.
		rec borderWidth: 2.
		rec color: Color black.
		self addMorph: rec.
		self personM: rec
		"self personM openInWorld." ].
	self personM position: self position + (a @ b)
]

{ #category : #'as yet unclassified' }
LaberintoGUI >> mostrarVidasPersonaje [
	|tM|
	self vidasM ifNil:[
		tM := TextMorph new.
		tM borderWidth: 1.
		tM backgroundColor:Color green.
		tM color:Color black.
		"tM autoFit: true."
		tM contents: ' ',self person vidas asString,' '. 
		self addMorph: tM.
		tM position:self position +(5@40).
		self vidasM:tM.
	].
	self vidasM contents:' ',self person vidas asString,' '.

]

{ #category : #'event handling' }
LaberintoGUI >> mouseEnter: anEvent [
	anEvent hand newKeyboardFocus: self

]

{ #category : #'event handling' }
LaberintoGUI >> mouseLeave: anEvent [
	anEvent hand releaseKeyboardFocus: self

]

{ #category : #'as yet unclassified' }
LaberintoGUI >> normalizar [

	| minX minY unPunto |
	minX := 0.
	minY := 0.
	self juego laberinto hijos do: [ :each |
		minX := minX min: each punto x.
		minY := minY min: each punto y ].
	self juego laberinto hijos do: [ :each |
		unPunto := each punto.
		each punto: unPunto x + minX abs @ (unPunto y + minY abs) ]
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

{ #category : #acciones }
LaberintoGUI >> reset [

	self juego terminarBichos.
	self personM: nil.
	self bichosM: Dictionary new.
	self win ifNotNil: [ self win delete ].
	self iniciarJuego

]

{ #category : #acciones }
LaberintoGUI >> terminarBichos [
	self juego terminarBichos 
]

{ #category : #updating }
LaberintoGUI >> update:unObject [

	self mostrarVidasPersonaje.
	self mostrarPersonaje.
	"self mostrarBichos."

]

{ #category : #accessing }
LaberintoGUI >> vidasM [

	^ vidasM
]

{ #category : #accessing }
LaberintoGUI >> vidasM: anObject [

	vidasM := anObject
]

{ #category : #visitor }
LaberintoGUI >> visitarArmario:unArmario [
	
]

{ #category : #visitor }
LaberintoGUI >> visitarBomba:unaBomba [
	
]

{ #category : #visitor }
LaberintoGUI >> visitarHabitacion:unaHab [
	self dibujarContenedorRectangular: unaHab forma escala:1.

]

{ #category : #visitor }
LaberintoGUI >> visitarTunel:unTunel [
	
]

{ #category : #accessing }
LaberintoGUI >> win [

	^ win
]

{ #category : #accessing }
LaberintoGUI >> win: anObject [

	win := anObject
]
