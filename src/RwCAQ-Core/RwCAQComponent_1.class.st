Class {
	#name : 'RwCAQComponent_1',
	#superclass : 'Object',
	#instVars : [
		'name',
		'componentNames',
		'packages'
	],
	#category : 'RwCAQ-Core'
}

{ #category : 'accessing' }
RwCAQComponent_1 >> addComponentNamed: componentName [
	self componentNames add: componentName
]

{ #category : 'accessing' }
RwCAQComponent_1 >> addPackageNamed: packageName [
	self packages add: packageName
]

{ #category : 'accessing' }
RwCAQComponent_1 >> componentNames [
	^componentNames ifNil: [ componentNames := Set new ]
]

{ #category : 'accessing' }
RwCAQComponent_1 >> name [
	^name
]

{ #category : 'accessing' }
RwCAQComponent_1 >> name: object [
	name := object
]

{ #category : 'accessing' }
RwCAQComponent_1 >> packages [
	^packages ifNil: [ packages := Set new ]
]
