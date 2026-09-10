"
clase cuyas instancias almacenan la informacion de cada prestamo realizado


"
Class {
	#name : 'Prestamo',
	#superclass : 'Object',
	#instVars : [
		'material',
		'lector',
		'inicio',
		'vencimiento',
		'devolucion'
	],
	#category : 'TP1-Biblioteca',
	#package : 'TP1-Biblioteca'
}

{ #category : 'initialization' }
Prestamo class >> material: m lector: l instante: i [
|prestamo|
prestamo := self new.
prestamo setMaterial: m setLector: l setInstante: i.
^prestamo 
]

{ #category : 'accessing' }
Prestamo >> description [ 
^ ('El prestamo fue sacado a nombre de: ', self lector nombreCompleto , ' el dia: ', self inicio asDate asString , ' sobre el material: ', material titulo )
]

{ #category : 'accessing' }
Prestamo >> devolucion [
^devolucion 
]

{ #category : 'testing' }
Prestamo >> dias [
(self estaCerrado)
ifTrue: [ ^ (devolucion - inicio) days ] ifFalse: [ ^nil  ]
]

{ #category : 'comparing' }
Prestamo >> diasTranscurridosHasta: unInstante [
^ (unInstante - inicio) days.
]

{ #category : 'comparing' }
Prestamo >> estaCerrado [
^ self estaVigente not.
]

{ #category : 'testing' }
Prestamo >> estaVencidoA: unInstante [
(unInstante > vencimiento)
ifFalse: [ ^ false ] 
ifTrue: [ 
^(self estaVigente) 
]
]

{ #category : 'comparing' }
Prestamo >> estaVigente [

	devolucion ifNil: [ ^ false ] ifNotNil: [ ^ true ].
]

{ #category : 'testing' }
Prestamo >> excedioPlazo [
(self estaCerrado)
ifTrue: [ ^(devolucion > vencimiento) ] ifFalse: [ ^false ].
]

{ #category : 'accessing' }
Prestamo >> inicio [ 
^ inicio 
]

{ #category : 'accessing' }
Prestamo >> lector [
^ lector 
]

{ #category : 'accessing' }
Prestamo >> material [
^ material 
]

{ #category : 'testing' }
Prestamo >> plazoEnDias [
^ (vencimiento - inicio) days
]

{ #category : 'controlling' }
Prestamo >> registrarDevolucion: unInstante [
devolucion:= unInstante.
^ self

]

{ #category : 'initialization' }
Prestamo >> setMaterial: unMaterial setLector: unLector  setInstante: unInstante [
material := unMaterial .
lector := unLector .
inicio := unInstante .
vencimiento := (unInstante+ (unMaterial plazoEnDias) days).

]

{ #category : 'accessing' }
Prestamo >> vencimiento [
^ vencimiento 
]
