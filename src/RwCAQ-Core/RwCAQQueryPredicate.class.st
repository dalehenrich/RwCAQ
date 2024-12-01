Class {
	#name : 'RwCAQQueryPredicate',
	#superclass : 'GsQueryPredicate',
	#category : 'RwCAQ-Core'
}

{ #category : 'instance creation' }
RwCAQQueryPredicate class >> fromQueryStatement: aString [
  ^ (RwCAQQueryParser compileFormula: aString) immediateInvariant
]

{ #category : 'accessing' }
RwCAQQueryPredicate >> constant1: anObject [
  operand1 := RwCAQConstantReferenceAssociation
    newWithKey: anObject asString
    value: anObject
]

{ #category : 'accessing' }
RwCAQQueryPredicate >> constant2: anObject [
  operand2 := RwCAQConstantReferenceAssociation
    newWithKey: anObject asString
    value: anObject
]
