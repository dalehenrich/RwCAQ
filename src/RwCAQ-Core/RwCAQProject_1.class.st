Class {
	#name : 'RwCAQProject_1',
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
RwCAQProject_1 >> attributes [
	^attributes
]

{ #category : 'accessing' }
RwCAQProject_1 >> attributes: object [
	attributes := object
]

{ #category : 'accessing' }
RwCAQProject_1 >> componentNamed: componentName [
	^ self components
		detect: [ :each | each name = componentName ]
		ifNone: [ 
			self
				error:
					'No component named ' , componentName printString , ' in project '
						, self name printString ]
]

{ #category : 'accessing' }
RwCAQProject_1 >> components [
	^components
]

{ #category : 'accessing' }
RwCAQProject_1 >> components: object [
	components := object
]

{ #category : 'accessing' }
RwCAQProject_1 >> gemstoneVersion [
	^gemstoneVersion
]

{ #category : 'accessing' }
RwCAQProject_1 >> gemstoneVersion: object [
	gemstoneVersion := object
]

{ #category : 'accessing' }
RwCAQProject_1 >> name [
	^name
]

{ #category : 'accessing' }
RwCAQProject_1 >> name: object [
	name := object
]

{ #category : 'actions' }
RwCAQProject_1 >> packagesToLoad: componentName [
	| packagesToLoad loadComponent |
	packagesToLoad := Set new.
	loadComponent := self components
		detect: [ :each | each name = componentName ]
		ifNone: [ self error: 'No component named ' , componentName printString , ' found' ].
	packagesToLoad addAll: (loadComponent packagesToLoadUsing: self).
	^ packagesToLoad
]
