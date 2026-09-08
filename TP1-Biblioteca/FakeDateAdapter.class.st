Class {
	#name : 'FakeDateAdapter',
	#superclass : 'DatePort',
	#instVars : [
		'instante'
	],
	#category : 'TP1-Biblioteca',
	#package : 'TP1-Biblioteca'
}

{ #category : 'as yet unclassified' }
FakeDateAdapter class >> en: unDateTime [
^self new forzarFecha:unDateTime 

]

{ #category : 'as yet unclassified' }
FakeDateAdapter class >> enDia: unDia mes:unMes anio:unAnio [
^self new forzarDia: unDia mes:unMes anio:unAnio
]

{ #category : 'as yet unclassified' }
FakeDateAdapter >> avanzarDias: unaCantidad [
    instante:=instante+ unaCantidad days.
]

{ #category : 'as yet unclassified' }
FakeDateAdapter >> avanzarHoras: unaCantidadHoras [
    instante:=instante + unaCantidadHoras hours
]

{ #category : 'as yet unclassified' }
FakeDateAdapter >> forzarDia: unDia mes:unMes anio:unAnio [
instante:= DateAndTime year: unAnio month: unMes day:unDia hour:0 minute:0 second:0
]

{ #category : 'as yet unclassified' }
FakeDateAdapter >> forzarDia: unDia mes: unMes anio: unAnio hora: unaHora minuto: unMin [
    instante:=DateAndTime year: unAnio month: unMes day: unDia hour: unaHora minute: unMin second: 0
]

{ #category : 'as yet unclassified' }
FakeDateAdapter >> forzarFecha: unDateTime [
instante:= unDateTime 

]

{ #category : 'accessing' }
FakeDateAdapter >> now [
^instante.
]
