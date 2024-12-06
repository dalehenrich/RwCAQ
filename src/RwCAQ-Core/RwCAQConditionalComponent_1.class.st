Class {
	#name : 'RwCAQConditionalComponent_1',
	#superclass : 'RwCAQComponent_1',
	#instVars : [
		'queryString',
		'condition',
		'theQuery',
		'gemstoneVersion'
	],
	#category : 'RwCAQ-Core'
}

{ #category : 'accessing' }
RwCAQConditionalComponent_1 >> condition [
	^condition
]

{ #category : 'accessing' }
RwCAQConditionalComponent_1 >> condition: object [
	condition := object
]

{ #category : 'accessing' }
RwCAQConditionalComponent_1 >> gemstoneVersion [
	^gemstoneVersion
]

{ #category : 'accessing' }
RwCAQConditionalComponent_1 >> gemstoneVersion: object [
	gemstoneVersion := object
]

{ #category : 'actions' }
RwCAQConditionalComponent_1 >> packagesToLoadUsing: aProject [
	| thePackages |
	(aProject attributes includes: self condition)
		ifFalse: [ ^ {} ].
	self gemstoneVersion: aProject gemstoneVersion.
	thePackages := (self theQuery on: {self}) isEmpty
		ifTrue: [ Set new ]
		ifFalse: [ self packages ].
	self componentNames
		do: [ :componentName | 
			| aComponent |
			aComponent := aProject componentNamed: componentName.
			thePackages addAll: (aComponent packagesToLoadUsing: aProject) ].
	^ thePackages
]

{ #category : 'accessing' }
RwCAQConditionalComponent_1 >> query [
	^ RwCAQQuery fromString: self queryString
]

{ #category : 'accessing' }
RwCAQConditionalComponent_1 >> queryString [
	^queryString
]

{ #category : 'accessing' }
RwCAQConditionalComponent_1 >> queryString: aString [
	queryString := aString trimBoth
]

{ #category : 'accessing' }
RwCAQConditionalComponent_1 >> theQuery [
	^ theQuery ifNil: [ theQuery := self query ]
]
