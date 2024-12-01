Class {
	#name : 'RwCAQVariableReferenceAssociation',
	#superclass : 'GsVariableReferenceAssociation',
	#category : 'RwCAQ-Core'
}

{ #category : 'accessing' }
RwCAQVariableReferenceAssociation >> value [
  self bound
    ifFalse: [ ^ false ].
  ^ super value
]
