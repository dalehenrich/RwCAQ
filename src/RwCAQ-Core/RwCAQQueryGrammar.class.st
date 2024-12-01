Class {
	#name : 'RwCAQQueryGrammar',
	#superclass : 'GsQueryGrammar',
	#instVars : [
		'gemstoneVersion',
		'gemstoneVersionLiteral',
		'gemstoneVersionToken'
	],
	#category : 'RwCAQ-Core'
}

{ #category : 'primitives' }
RwCAQQueryGrammar >> gemstoneVersion [
  ^ (#'digit' asParser) and
    ,
      [ :stream |
      [ RwGemStoneVersionNumber fromStream: stream ]
        on: Error
        do: [ :err | PPFailure message: err messageText at: stream position ] ]
        asParser
]

{ #category : 'grammar-literals' }
RwCAQQueryGrammar >> gemstoneVersionLiteral [
	^ gemstoneVersionToken
]

{ #category : 'token' }
RwCAQQueryGrammar >> gemstoneVersionToken [
  ^ gemstoneVersion queryToken
]

{ #category : 'grammar' }
RwCAQQueryGrammar >> literal [
  ^  gemstoneVersionLiteral / numberLiteral / stringLiteral / charLiteral / arrayLiteral / byteLiteral
    / symbolLiteral / nilLiteral / trueLiteral / falseLiteral
]
