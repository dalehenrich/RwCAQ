Class {
	#name : 'RwCAQQuery',
	#superclass : 'GsQuery',
	#category : 'RwCAQ-Core'
}

{ #category : 'instance creation' }
RwCAQQuery class >> fromString: aString [
  ^ self fromFormula: (RwCAQQueryPredicate fromQueryStatement: aString)
]

{ #category : 'accessing' }
RwCAQQuery >> formula [
	"no query optimization"

	^ formula
]
