Class {
	#name : 'RwCAQConditionalComponent_3',
	#superclass : 'RwCAQComponent_1',
	#instVars : [
		'queryString',
		'theQuery',
		'gemstoneVersion'
	],
	#category : 'RwCAQ-Core'
}

{ #category : 'accessing' }
RwCAQConditionalComponent_3 >> gemstoneVersion [
	^gemstoneVersion
]

{ #category : 'accessing' }
RwCAQConditionalComponent_3 >> gemstoneVersion: object [
	gemstoneVersion := object
]

{ #category : 'actions' }
RwCAQConditionalComponent_3 >> packagesToLoadUsing: aProject [
	| thePackages |
	theQuery := nil.
	aProject attributes do: [ :attribute | self theQuery bind: attribute to: true ].
	self gemstoneVersion: aProject gemstoneVersion.
	thePackages := (self theQuery on: (Set with: self)) isEmpty
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
RwCAQConditionalComponent_3 >> query [
	^ RwCAQQuery fromString: self queryString
]

{ #category : 'accessing' }
RwCAQConditionalComponent_3 >> queryString [
	^queryString
]

{ #category : 'accessing' }
RwCAQConditionalComponent_3 >> queryString: aString [
	queryString := aString trimBoth
]

{ #category : 'accessing' }
RwCAQConditionalComponent_3 >> theQuery [
	^ theQuery ifNil: [ theQuery := self query ]
]
