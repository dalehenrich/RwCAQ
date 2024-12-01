Class {
	#name : 'RwCAQVariableReferenceAssociation',
	#superclass : 'GsVariableReferenceAssociation',
	#category : 'RwCAQ-Core'
}

{ #category : 'converting' }
RwCAQVariableReferenceAssociation >> asFormula [
  ^ RwCAQConstantConstantPredicate new
    constant1: self;
    operator: #'unary';
    immediateInvariant
]

{ #category : 'accessing' }
RwCAQVariableReferenceAssociation >> value [
  self bound
    ifFalse: [ ^ false ].
  ^ super value
]
