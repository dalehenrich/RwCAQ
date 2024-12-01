Class {
	#name : 'RwCAQQueryParser',
	#superclass : 'RwCAQQueryGrammar',
	#category : 'RwCAQ-Core'
}

{ #category : 'instance creation' }
RwCAQQueryParser class >> compileFormula: aString [
  ^ (self parseFormula: aString) asFormula

]

{ #category : 'instance creation' }
RwCAQQueryParser class >> compileFormula: aString onError: aBlock [
  ^ (self parseFormula: aString onError: aBlock) asFormula

]

{ #category : 'grammar-literals' }
RwCAQQueryParser >> andBlock [
  ^ [ :predicate1 :operator :predicate2 |
  predicate1 asFormula
    asFormulaWithSelectorParts: {operator}
    arguments: {(predicate2 asFormula)} ]

]

{ #category : 'grammar-literals' }
RwCAQQueryParser >> arrayLiteral [
  ^ super arrayLiteral
    ==> [ :nodes |
      GsQueryLiteralArray new
        contents: (nodes at: 2);
        isByteArray: false;
        yourself ]

]

{ #category : 'grammar-literals' }
RwCAQQueryParser >> arrayLiteralArray [
  ^ super arrayLiteralArray
    ==> [ :nodes |
      GsQueryLiteralArray new
        contents: (nodes at: 2);
        isByteArray: false;
        yourself ]

]

{ #category : 'private' }
RwCAQQueryParser >> build: aNode messages: anArray [
  ^ (anArray == nil  or: [ anArray isEmpty ])
    ifTrue: [ aNode ]
    ifFalse: [
      anArray
        inject: aNode
        into: [ :receiver :messageArray |
          messageArray == nil
            ifTrue: [ receiver ]
            ifFalse: [
              (messageArray at: 2) isEmpty
                ifTrue: [ receiver asFormulaWithSelectorParts: messageArray first ]
                ifFalse: [
                  receiver
                    asFormulaWithSelectorParts: messageArray first
                    arguments: (messageArray at: 2) ] ] ] ]

]

{ #category : 'private' }
RwCAQQueryParser >> buildString: aString [
	(aString isEmpty or: [ aString first ~= $' or: [ aString last ~= $' ] ])
		ifTrue: [ ^ aString ].
	^ (aString
		copyFrom: 2
		to: aString size - 1)
		copyReplaceAll: ''''''
		with: ''''

]

{ #category : 'grammar-literals' }
RwCAQQueryParser >> byteLiteral [
  ^ super byteLiteral
    ==> [ :nodes |
      GsQueryLiteralArray new
        contents: (nodes at: 2);
        isByteArray: true;
        yourself ]

]

{ #category : 'grammar-literals' }
RwCAQQueryParser >> byteLiteralArray [
  ^ super byteLiteralArray
    ==> [ :nodes |
      GsQueryLiteralArray new
        contents: (nodes at: 2);
        isByteArray: true;
        yourself ]

]

{ #category : 'grammar-literals' }
RwCAQQueryParser >> charLiteral [
  ^ super charLiteral
    ==> [ :token |
      GsQueryLiteralValue new
        value: (token inputValue at: 2);
        yourself ]

]

{ #category : 'grammar-messages' }
RwCAQQueryParser >> expression [
  ^ super expression
    map: [ :arrayOrNode | arrayOrNode buildGsQueryParserNodeFor: self ]

]

{ #category : 'grammar-literals' }
RwCAQQueryParser >> falseLiteral [
  ^ super falseLiteral
    ==> [ :token |
      GsQueryLiteralValue new
        value: false;
        yourself ]

]

{ #category : 'grammar-literals' }
RwCAQQueryParser >> gemstoneVersionLiteral [
  ^ super gemstoneVersionLiteral
    ==> [ :token |
      GsQueryLiteralValue new
        value: (RwGemStoneVersionNumber fromStream: token inputValue readStream);
        yourself ]
]

{ #category : 'grammar-literals' }
RwCAQQueryParser >> nilLiteral [
  ^ super nilLiteral
    ==> [ :token |
      GsQueryLiteralValue new
        value: nil;
        yourself ]

]

{ #category : 'grammar-literals' }
RwCAQQueryParser >> notBlock [
  ^ [ :predicate1 :operator | predicate1 asFormulaWithSelectorParts: {operator} ]

]

{ #category : 'grammar-literals' }
RwCAQQueryParser >> numberLiteral [
  ^ super numberLiteral
    ==> [ :token |
      GsQueryLiteralValue new
        value: (Number fromStream: token inputValue readStream);
        yourself ]

]

{ #category : 'grammar-literals' }
RwCAQQueryParser >> orBlock [
  ^ [ :predicate1 :operator :predicate2 |
  predicate1 asFormula
    asFormulaWithSelectorParts: {operator}
    arguments: {(predicate2 asFormula)} ]

]

{ #category : 'grammar' }
RwCAQQueryParser >> parenExpression [
  ^ super parenExpression
    map: [ :openToken :expressionNode :closeToken | expressionNode ]

]

{ #category : 'grammar' }
RwCAQQueryParser >> parenPredicate [
  ^ super parenPredicate
    map: [ :openToken :expressionNode :closeToken | expressionNode ]

]

{ #category : 'grammar' }
RwCAQQueryParser >> pathToken [
  ^ super pathToken
    ==> [ :token | GsPathReferenceAssociation newWithKey: token inputValue asString value: nil ]

]

{ #category : 'grammar' }
RwCAQQueryParser >> queryPathToken [
  ^ super queryPathToken
    ==> [ :token | GsQueryPathReferenceAssociation newWithKey: token inputValue asString value: nil ]

]

{ #category : 'grammar-messages' }
RwCAQQueryParser >> rangePredicateExpression [
  ^ super rangePredicateExpression
    map: [ :primary1 :relop1 :queryPath1 :relop2 :primary2 |
      GsRangeQueryPredicate
        operand: primary1 asReferenceAssociation
        operator: relop1 inputValue asSymbol
        path: queryPath1 asReferenceAssociation
        operator: relop2 inputValue asSymbol
        operand: primary2 asReferenceAssociation ]

]

{ #category : 'grammar-messages' }
RwCAQQueryParser >> simplePredicateExpression [
  ^ super simplePredicateExpression
    map: [ :receiverNode :messageNodes | self build: receiverNode messages: messageNodes ]

]

{ #category : 'grammar-literals' }
RwCAQQueryParser >> stringLiteral [
  ^ super stringLiteral
    ==> [ :token |
      GsQueryLiteralValue new
        value: (self buildString: token inputValue);
        yourself ]

]

{ #category : 'grammar-literals' }
RwCAQQueryParser >> symbolLiteral [
  ^ super symbolLiteral
    ==> [ :tokens |
      GsQueryLiteralValue new
        value: (self buildString: tokens last inputValue) asSymbol;
        yourself ]

]

{ #category : 'grammar-literals' }
RwCAQQueryParser >> symbolLiteralArray [
  ^ super symbolLiteralArray
    ==> [ :tokens |
      GsQueryLiteralValue new
        value: (self buildString: tokens last inputValue) asSymbol;
        yourself ]

]

{ #category : 'grammar-literals' }
RwCAQQueryParser >> trueLiteral [
  ^ super trueLiteral
    ==> [ :token |
      GsQueryLiteralValue new
        value: true;
        yourself ]

]

{ #category : 'grammar' }
RwCAQQueryParser >> variable [
  ^ super variable
    ==> [ :token | GsVariableReferenceAssociation newWithKey: token inputValue asString value: nil ]

]
