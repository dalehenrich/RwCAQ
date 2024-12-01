Class {
	#name : 'RwCAQLoadComponent',
	#superclass : 'RwCAQComponent',
	#category : 'RwCAQ-Core'
}

{ #category : 'actions' }
RwCAQLoadComponent >> packagesToLoadUsing: aProject [
	^ self packages
]
