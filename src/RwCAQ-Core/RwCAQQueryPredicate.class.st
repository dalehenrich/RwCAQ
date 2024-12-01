Class {
	#name : 'RwCAQQueryPredicate',
	#superclass : 'GsQueryPredicate',
	#category : 'RwCAQ-Core'
}

{ #category : 'instance creation' }
RwCAQQueryPredicate class >> fromQueryStatement: aString [
  ^ (RwCAQQueryParser compileFormula: aString) immediateInvariant
]
