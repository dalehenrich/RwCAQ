Class {
	#name : 'RwCAQProject',
	#superclass : 'Object',
	#instVars : [
		'name',
		'components',
		'attributes',
		'gemstoneVersion'
	],
	#category : 'RwCAQ-Core'
}

{ #category : 'accessing' }
RwCAQProject >> attributes [
	^attributes
]

{ #category : 'accessing' }
RwCAQProject >> attributes: object [
	attributes := object
]

{ #category : 'accessing' }
RwCAQProject >> components [
	^components
]

{ #category : 'accessing' }
RwCAQProject >> components: object [
	components := object
]

{ #category : 'accessing' }
RwCAQProject >> gemstoneVersion [
	^gemstoneVersion
]

{ #category : 'accessing' }
RwCAQProject >> gemstoneVersion: object [
	gemstoneVersion := object
]

{ #category : 'accessing' }
RwCAQProject >> name [
	^name
]

{ #category : 'accessing' }
RwCAQProject >> name: object [
	name := object
]

{ #category : 'actions' }
RwCAQProject >> packagesToLoad: componentName [
	| packagesToLoad |
	packagesToLoad := Set new.
	self components
		do: [ :each | packagesToLoad addAll: (each packagesToLoadUsing: self) ].
	^ packagesToLoad
]
