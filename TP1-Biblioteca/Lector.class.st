"
clase puntual que modela a los usuarios del sistema

"
Class {
	#name : 'Lector',
	#superclass : 'Persona',
	#instVars : [
		'numero',
		'esMoroso'
	],
	#category : 'TP1-Biblioteca',
	#package : 'TP1-Biblioteca'
}

{ #category : 'initialization' }
Lector class >> numero: unNumero nombre: unNombre apellido: unApellido cuit: unCuit [ 
|lector|
lector := self new.
lector setNumero: unNumero setNombre: unNombre setApellido: unApellido setCuit: unCuit. 
^ lector 
]

{ #category : 'testing' }
Lector >> apellidoContiene: unTexto [
^(apellido includesSubstring: unTexto caseSensitive: false )
]

{ #category : 'accessing' }
Lector >> esMoroso [
^ esMoroso 
]

{ #category : 'controlling' }
Lector >> marcarMoroso [
esMoroso := true.
^ self
]

{ #category : 'testing' }
Lector >> motivoDeRechazo [
(self puedeLlevar)
ifTrue: [ ^ nil ].
(self esMoroso)
ifTrue: [ ^ #enMora ]
]

{ #category : 'copying' }
Lector >> nombreCompleto [
^ nombre , ' ' , apellido 
]

{ #category : 'accessing' }
Lector >> numero [
^ numero 
]

{ #category : 'accessing' }
Lector >> puedeLlevar [
^ (esMoroso not)
]

{ #category : 'controlling' }
Lector >> rehabilitar [
esMoroso :=false.
^self
]

{ #category : 'initialization' }
Lector >> setNumero: unNumero setNombre: unNombre setApellido: unApellido setCuit: unCuit [ 
numero := unNumero.
nombre := unNombre.
apellido := unApellido.
cuit := unCuit.
esMoroso := false.
]
