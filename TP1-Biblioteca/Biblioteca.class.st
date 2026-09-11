"
Gestor de todos las instancias y motor principal del sistema

"
Class {
	#name : 'Biblioteca',
	#superclass : 'Object',
	#instVars : [
		'nombre',
		'datePort',
		'catalogo',
		'lectores',
		'prestamos'
	],
	#category : 'TP1-Biblioteca',
	#package : 'TP1-Biblioteca'
}

{ #category : 'instance creation' }
Biblioteca class >> nombre: unString datePort: unDatePort [
|unaBiblioteca|
unaBiblioteca := self new.
unaBiblioteca setNombre: unString setDatePort: unDatePort.
^ unaBiblioteca 
]

{ #category : 'operations' }
Biblioteca >> agregarLector: l [ 
"verificamos primero numero de lector y cuit"
|existe| 
existe := lectores anySatisfy: [ :cadaElemento | ((cadaElemento numero) = l numero) | (cadaElemento cuit = l cuit)].
(existe) 
ifFalse: [
	 lectores add: l.
	 ^ l ] 
ifTrue: [ 
	Transcript show: 'El lector ya se encontraba en el sistema.'.
	^ nil ].


]

{ #category : 'testing' }
Biblioteca >> buscarLectoresPorApellido: unTexto [ 
|r|
r:= lectores select:[:cada|cada apellido includesSubstring: unTexto caseSensitive: false].
^r.
]

{ #category : 'testing' }
Biblioteca >> cantidadDePrestamosDe: unNumero [
|p|
p := self prestamosDe: unNumero.
^ p size.

]

{ #category : 'operations' }
Biblioteca >> catalogar: m [
|existe| 
existe := catalogo anySatisfy: [ :cadaElemento | ((cadaElemento codigo ) = m codigo)].
(existe) 
ifFalse: [
	 catalogo add: m.
	 ^ m ] 
ifTrue: [ 
	Transcript show: 'Ya existe un material con ese código'.
	^ nil ].
]

{ #category : 'accessing' }
Biblioteca >> catalogo [
^catalogo 
]

{ #category : 'operations' }
Biblioteca >> devolver: unCodigo [
|p m|
p := prestamos select:[:cada| cada estaVigente].
m := p detect: [ :cadaPrestamoVigente| cadaPrestamoVigente material codigo = unCodigo ] ifNone: [ m:=nil].

(m) ifNil:[
	Transcript show: 'El material no se encuentra en la lista de prestamos vigentes'.
	^nil.
	].

m registrarDevolucion: datePort.


]

{ #category : 'testing' }
Biblioteca >> esMoroso: unNumero [ 
^ (self lectorNumero: unNumero )esMoroso .
]

{ #category : 'testing' }
Biblioteca >> estaPrestado: unCodigo [
|p m|
p := prestamos select:[:cada| cada estaVigente].
m := p detect: [ :cadaPrestamoVigente| cadaPrestamoVigente material codigo = unCodigo ] ifNone: [ m:=nil].
m ifNil: [^false] ifNotNil:[^true]. 

]

{ #category : 'printing' }
Biblioteca >> identificarCuit: unCuit [ 
|l p f|
l:= lectores select:[:cada|cada cuit = unCuit ].
(l)ifNil: [ ^nil ].

p:= self prestamosVigentesDe: l numero .
f:= FichaDeLector lector: l prestamosVigentes: p.
^f.


]

{ #category : 'printing' }
Biblioteca >> identificarSocio: unNumero [
|l f p|
l:=(self lectorNumero: unNumero).
(l)ifNil: [ ^nil ].
p:= self prestamosVigentesDe: unNumero .
f:= FichaDeLector lector: l prestamosVigentes: p.
^f.
]

{ #category : 'initialization' }
Biblioteca >> initialize [ 
super initialize.
catalogo := OrderedCollection new.
lectores := OrderedCollection new.
prestamos := OrderedCollection new.
]

{ #category : 'testing' }
Biblioteca >> lectorNumero: n [
^lectores detect: [ :cada | cada numero = n ] ifNone: [ nil ].
]

{ #category : 'accessing' }
Biblioteca >> lectores [
^lectores 
]

{ #category : 'testing' }
Biblioteca >> lectoresMorosos [ 
|r|
r:= lectores select:[:cada | cada esMoroso ].
^r 
]

{ #category : 'testing' }
Biblioteca >> materialCodigo: n [
^catalogo detect: [ :cada | cada codigo = n ] ifNone: [ nil ].
]

{ #category : 'operations' }
Biblioteca >> materialesDe: nom [ 
^ catalogo select: [ :cadaElemento | cadaElemento autores includes: nom].
]

{ #category : 'testing' }
Biblioteca >> prestamoVigenteDe: unNumero [
|m p|
p := prestamos select:[:cada| cada estaVigente].
m := p detect: [ :cadaPrestamoVigente| cadaPrestamoVigente lector numero = unNumero ] ifNone: [ m:=nil].

^m.
]

{ #category : 'accessing' }
Biblioteca >> prestamos [
^ prestamos .
]

{ #category : 'testing' }
Biblioteca >> prestamosDe: unNumero [
|p|
p := prestamos select:[:cada| cada lector numero = unNumero ].
^p.
]

{ #category : 'testing' }
Biblioteca >> prestamosDelMaterial: unCodigo [
|l|
l := prestamos select:[:cada| cada material codigo  = unCodigo ].
^ l .
]

{ #category : 'testing' }
Biblioteca >> prestamosVencidos [ 
|r s|
r:= self prestamosVigentes.
s:= r select: [ :cada| cada vencimiento < datePort ].
^s.
]

{ #category : 'accessing' }
Biblioteca >> prestamosVigentes [
|r|
r := prestamos select:[:cada| cada estaVigente].
^r.
]

{ #category : 'testing' }
Biblioteca >> prestamosVigentesDe: unNumero [ 
|r|
r:= (self prestamosDe: unNumero) select:[:cada | cada estaVigente ] .
^r.

]

{ #category : 'operations' }
Biblioteca >> prestar: unCodigo a: unNumero [
|l m p|
m :=self materialCodigo: unCodigo.
(m) ifNil:[ 
	Transcript 
	show: 'El codigo buscado no se encuentra en el catalogo';cr.
	^nil ].
l:=self lectorNumero: unNumero.
(l) ifNil: [ 
	Transcript 
	show: 'El numero de usuario buscado no se encuentra en los registros';cr.
	 ].
(l esMoroso) ifTrue: [ 
	Transcript 
	show: ('El lector numero: ', l numero , ' es MOROSO.').
	^nil.
	 ].
(self estaPrestado: unCodigo) ifTrue: [ 
	Transcript 
	show: 'El material se encuentra prestado actualmente'.
	^nil.
	 ].
p := Prestamo material: m  lector: l  instante: datePort . 
prestamos add: p.
^p.

]

{ #category : 'operations' }
Biblioteca >> rehabilitar: unNumero [ 
|l|
l:= self lectorNumero: unNumero.
(l)ifNil:[^ false ].
(l esMoroso ) ifFalse:[^ false].
l rehabilitar.
^ true.
]

{ #category : 'initialization' }
Biblioteca >> setNombre: unNombre setDatePort: unDatePort [
nombre := unNombre .
datePort := unDatePort .
]
