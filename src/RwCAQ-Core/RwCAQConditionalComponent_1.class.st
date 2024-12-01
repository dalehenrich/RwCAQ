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
	^ (GsQuery fromString: self queryString)
		bind: 'v361' to: '3.6.1' asRwGemStoneVersionNumber;
		bind: 'v370' to: '3.7.0' asRwGemStoneVersionNumber;
		yourself
]

{ #category : 'accessing' }
RwCAQConditionalComponent_1 >> queryString [
	^queryString
]

{ #category : 'accessing' }
RwCAQConditionalComponent_1 >> queryString: object [
	queryString := object
]

{ #category : 'accessing' }
RwCAQConditionalComponent_1 >> theQuery [
	^ theQuery ifNil: [ theQuery := self query ]
]
