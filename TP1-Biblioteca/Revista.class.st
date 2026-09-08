Class {
	#name : 'Revista',
	#superclass : 'MaterialCatalogado',
	#instVars : [
		'issn',
		'numero',
		'mesDeEdicion'
	],
	#category : 'TP1-Biblioteca',
	#package : 'TP1-Biblioteca'
}

{ #category : 'as yet unclassified' }
Revista class >> issn: unIssn titulo: unTitulo autores: unosAutores editorial: unaEditorial anio: unAnio paginas: numPags numero: num mes: unMes [
 |nuevo|
nuevo:=self new.
nuevo issn: unIssn titulo: unTitulo autores: unosAutores editorial: unaEditorial anio: unAnio paginas: numPags numero: num mes: unMes.
^nuevo.
]

{ #category : 'as yet unclassified' }
Revista >> codigo [ ^issn, '-',numero asString.

]

{ #category : 'accessing' }
Revista >> issn [

	^ issn
]

{ #category : 'accessing' }
Revista >> issn: unIssn [

	issn := unIssn
]

{ #category : 'as yet unclassified' }
Revista >> issn: unIssn titulo: unTitulo autores: unosAutores editorial: unaEditorial anio: unAnio paginas: numPags numero: num mes: unMes [
issn:= unIssn.
titulo:= unTitulo.
autores:= unosAutores.
editorial:= unaEditorial.
anioDeEdicion:= unAnio.
paginas:= numPags.
numero:= num.
mesDeEdicion:= unMes.
]

{ #category : 'accessing' }
Revista >> mesDeEdicion [

	^ mesDeEdicion
]

{ #category : 'accessing' }
Revista >> mesDeEdicion: unMes [

	mesDeEdicion := unMes
]

{ #category : 'accessing' }
Revista >> numero [

	^ numero
]

{ #category : 'accessing' }
Revista >> numero: num [

	numero := num
]

{ #category : 'accessing' }
Revista >> plazoEnDias [ 
^7 asInteger 

]

{ #category : 'as yet unclassified' }
Revista >> tipo [ ^'revista'
]

{ #category : 'as yet unclassified' }
Revista >> tipoDeIdentificador [ ^'ISSN'.
]
