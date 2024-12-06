Class {
	#name : 'RwCAQConditionalComponent',
	#superclass : 'RwCAQComponent',
	#instVars : [
		'queryString',
		'condition',
		'theQuery',
		'gemstoneVersion'
	],
	#category : 'RwCAQ-Core'
}

{ #category : 'accessing' }
RwCAQConditionalComponent >> condition [
	^condition
]

{ #category : 'accessing' }
RwCAQConditionalComponent >> condition: object [
	condition := object
]

{ #category : 'accessing' }
RwCAQConditionalComponent >> gemstoneVersion [
	^gemstoneVersion
]

{ #category : 'accessing' }
RwCAQConditionalComponent >> gemstoneVersion: object [
	gemstoneVersion := object
]

{ #category : 'actions' }
RwCAQConditionalComponent >> packagesToLoadUsing: aProject [
	(aProject attributes includes: self condition)
		ifTrue: [ 
			self gemstoneVersion: aProject gemstoneVersion.
			(self theQuery on: {self}) asArray ifNotEmpty: [ ^ self packages ] ].
	^ {}
]

{ #category : 'accessing' }
RwCAQConditionalComponent >> query [
	^ RwCAQQuery fromString: self queryString
]

{ #category : 'accessing' }
RwCAQConditionalComponent >> queryString [
	^queryString
]

{ #category : 'accessing' }
RwCAQConditionalComponent >> queryString: aString [
	queryString := aString trimBoth
]

{ #category : 'accessing' }
RwCAQConditionalComponent >> theQuery [
	^ theQuery ifNil: [ theQuery := self query ]
]
