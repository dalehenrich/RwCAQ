Class {
	#name : 'RwCAQConstantConstantPredicate',
	#superclass : 'RwCAQQueryPredicate',
	#category : 'Index-Query'
}

{ #category : 'private' }
RwCAQConstantConstantPredicate >> _evaluators [
  "return list of evaluators associated with predicate"

  ^ #()

]

{ #category : 'initialization' }
RwCAQConstantConstantPredicate >> _fromArray: varsArray terms: termsArray links: linksArray paths: pathsArray startingAt: i [
  self constant1: (varsArray at: (termsArray at: i + 5)).
  operator := self operationSelectors at: (termsArray at: i) + 1.
  self constant2: (varsArray at: (termsArray at: i + 2))

]

{ #category : 'transforming' }
RwCAQConstantConstantPredicate >> bind: variableName to: value [
  ^ self operator == #'unary'
    ifTrue: [
      | bound |
      bound := self copy.
      bound operand1: (bound operand1 bind: variableName to: value).
      ^ bound immediateInvariant ]
    ifFalse: [ super bind: variableName to: value ]

]

{ #category : 'querying-private' }
RwCAQConstantConstantPredicate >> elementValue: anObject [
  "the pathTerms in the query will use anObject as the starting point ... analagous to an object in the nsc that is bound to a query"

  ^ self executePredicate

]

{ #category : 'querying' }
RwCAQConstantConstantPredicate >> executeAndDo: aBlock [
  self executePredicate
    ifTrue: [ nsc do: aBlock ]

]

{ #category : 'querying-private' }
RwCAQConstantConstantPredicate >> executeClause [
  ^ self executePredicate
    ifTrue: [ nsc ]
    ifFalse: [ nsc species new ]

]

{ #category : 'querying-private' }
RwCAQConstantConstantPredicate >> executeClauseNegated [
  self executePredicateNegated
    ifTrue: [ ^ nsc ]
    ifFalse: [ ^ nsc species new ]

]

{ #category : 'querying-private' }
RwCAQConstantConstantPredicate >> executeNegatedAndDo: aBlock [
  self executePredicateNegated
    ifTrue: [ nsc do: aBlock ]

]

{ #category : 'querying-private' }
RwCAQConstantConstantPredicate >> executePredicate [
  ^ self operator == #'unary'
    ifTrue: [ self operand1 _idxValue ]
    ifFalse: [
      self operand1 _idxValue
        perform: (self comparisonSelectorFor: self operator)
        with: self operand2 _idxValue ]

]

{ #category : 'querying-private' }
RwCAQConstantConstantPredicate >> executePredicateNegated [
  ^ self operator == #'unary'
    ifTrue: [ self operand1 _idxValue not ]
    ifFalse: [ self operand1 _idxValue perform: self operatorNegated with: self operand2 _idxValue ]

]

{ #category : 'testing' }
RwCAQConstantConstantPredicate >> isConstantBound [
  self operator == #'unary'
    ifTrue: [ ^ self operand1 isBound ].
  ^ self operand1 isBound and: [ self operand2 isBound ]

]

{ #category : 'testing' }
RwCAQConstantConstantPredicate >> isConstantConstant [
  ^ true

]

{ #category : 'printing' }
RwCAQConstantConstantPredicate >> printOn: aStream [
  self operator ~~ #'unary'
    ifTrue: [ ^ super printOn: aStream ].
  aStream nextPutAll: '( ' , self operand1 key asString , ' )'

]

{ #category : 'querying' }
RwCAQConstantConstantPredicate >> readStream [
  self shouldNotImplement: #'readStream'

]
