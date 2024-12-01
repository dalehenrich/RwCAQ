Class {
	#name : 'RwCAQComponent',
	#superclass : 'Object',
	#instVars : [
		'name',
		'packages'
	],
	#category : 'RwCAQ-Core'
}

{ #category : 'accessing' }
RwCAQComponent >> addPackageNamed: packageName [
	self packages add: packageName
]

{ #category : 'accessing' }
RwCAQComponent >> name [
	^name
]

{ #category : 'accessing' }
RwCAQComponent >> name: object [
	name := object
]

{ #category : 'accessing' }
RwCAQComponent >> packages [
	^packages ifNil: [ packages := Set new ]
]
