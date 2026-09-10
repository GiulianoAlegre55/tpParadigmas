"
Es lo que la biblioteca contesta cuando alguien se identifica en el mostrador: un Data Transfer Object ( DTO ). Contiene solo valores -números, strings, símbolos y booleanos-. No tiene ninguna referencia a un Lector, a un Prestamo ni a un material, la arma la Biblioteca y no se modifica una vez creada. Ningún atributo lleva método de escritura. 
"
Class {
	#name : 'FichaDeLector',
	#superclass : 'Object',
	#instVars : [
		'numero',
		'cuit',
		'nombreCompleto',
		'esMoroso',
		'motivoDeRechazo',
		'codigos'
	],
	#category : 'TP1-Biblioteca',
	#package : 'TP1-Biblioteca'
}

{ #category : 'initialization' }
FichaDeLector class >> lector: unLector prestamosVigentes: prestamos [
|f|
f := self new.
f setLector: unLector setPrestamosVigentes: prestamos.
^ f.
]

{ #category : 'testing' }
FichaDeLector >> cantidadEnPoder [
^ codigos size.
]

{ #category : 'accessing' }
FichaDeLector >> codigoEnPoder [
^codigos
]

{ #category : 'accessing' }
FichaDeLector >> cuit [
^cuit.
]

{ #category : 'accessing' }
FichaDeLector >> esMoroso [
^esMoroso
]

{ #category : 'initialization' }
FichaDeLector >> initialize [ 
super initialize.
codigos := OrderedCollection new.
]

{ #category : 'accessing' }
FichaDeLector >> motivoDeRechazo [
^motivoDeRechazo
]

{ #category : 'accessing' }
FichaDeLector >> nombreCompleto [
^nombreCompleto
]

{ #category : 'accessing' }
FichaDeLector >> numero [
^ numero 
]

{ #category : 'accessing' }
FichaDeLector >> puedeLlevar [ 
^ motivoDeRechazo isNil 
]

{ #category : 'initialization' }
FichaDeLector >> setLector: unLector setPrestamosVigentes: prestamos [
numero := unLector numero .
cuit:= unLector cuit.
nombreCompleto := unLector nombreCompleto.
esMoroso := unLector esMoroso.
motivoDeRechazo := unLector motivoDeRechazo .
prestamos do:[:cadaElemento|  codigos add: (cadaElemento material) codigo ]
]
