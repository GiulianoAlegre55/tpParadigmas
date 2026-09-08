"
Clase que modela el comportamiento de los libros

"
Class {
	#name : 'Libro',
	#superclass : 'MaterialCatalogado',
	#instVars : [
		'isbn'
	],
	#category : 'TP1-Biblioteca',
	#package : 'TP1-Biblioteca'
}

{ #category : 'initialization' }
Libro class >> isbn: unIsbn titulo: unTitulo autores: unAutor editorial: unaEditorial anio: unAnio paginas: cantPaginas [
|l|
l := self new.
l setIsbn: unIsbn setTitulo: unTitulo setAutores: unAutor setEditorial: unaEditorial setAnio: unAnio setPaginas: cantPaginas.
^ l 
]

{ #category : 'accessing' }
Libro >> plazoEnDias [
^ 15 asInteger 
]

{ #category : 'initialization' }
Libro >> setIsbn: unIsbn setTitulo: unTitulo setAutores: unAutor setEditorial: unaEditorial setAnio: unAnio setPaginas: cantPaginas [
isbn := unIsbn .
titulo := unTitulo .
autor := unAutor .
editorial := unaEditorial .
anioDeEdicion := unAnio .
paginas := cantPaginas .

]
