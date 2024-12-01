Class {
	#name : 'RwCAQConditionalComponent_2',
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
RwCAQConditionalComponent_2 >> condition [
	^condition
]

{ #category : 'accessing' }
RwCAQConditionalComponent_2 >> condition: object [
	condition := object
]

{ #category : 'accessing' }
RwCAQConditionalComponent_2 >> gemstoneVersion [
	^gemstoneVersion
]

{ #category : 'accessing' }
RwCAQConditionalComponent_2 >> gemstoneVersion: object [
	gemstoneVersion := object
]

{ #category : 'actions' }
RwCAQConditionalComponent_2 >> packagesToLoadUsing: aProject [
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
RwCAQConditionalComponent_2 >> query [
	^ RwCAQQuery fromString: self queryString
]

{ #category : 'accessing' }
RwCAQConditionalComponent_2 >> queryString [
	^queryString
]

{ #category : 'accessing' }
RwCAQConditionalComponent_2 >> queryString: aString [
	queryString := aString trimBoth
]

{ #category : 'accessing' }
RwCAQConditionalComponent_2 >> theQuery [
	^ theQuery ifNil: [ theQuery := self query ]
]
