Class {
	#name : 'RwCAQLoadComponent_1',
	#superclass : 'RwCAQComponent_1',
	#category : 'RwCAQ-Core'
}

{ #category : 'actions' }
RwCAQLoadComponent_1 >> packagesToLoadUsing: aProject [
	| packagesToLoad |
	packagesToLoad := Set new.
	packagesToLoad addAll: self packages.
	self componentNames
		do: [ :componentName | 
			| aComponent |
			aComponent := aProject componentNamed: componentName.
			packagesToLoad addAll: (aComponent packagesToLoadUsing: aProject) ].
	^ packagesToLoad
]
