Extension { #name : 'RwGemStoneVersionNumber' }

{ #category : 'instance creation' }
RwGemStoneVersionNumber class >> fromStream: aStream [
	| ch subString versionComponents dCount lastCharWasPeriod newVersion |
	versionComponents := OrderedCollection new.
	aStream peek unicodeIsWhitespace
		ifTrue: [ 
			[ 
			| c |
			c := aStream next.
			c ~~ nil and: [ c unicodeIsWhitespace ] ] whileTrue.
			aStream skip: -1 ].
	lastCharWasPeriod := true.
	[ (ch := aStream peek) ~~ nil and: [ ch isDigit or: [ lastCharWasPeriod ] ] ]
		whileTrue: [ 
			dCount := 0.
			subString := String new.
			[ (ch := aStream peek) ~~ nil and: [ ch isDigit ] ]
				whileTrue: [ 
					aStream next.
					subString add: ch.
					dCount := dCount + 1 ].
			dCount == 0
				ifTrue: [ ^ self _errIncorrectFormat: aStream ].
			versionComponents add: subString asInteger.
			lastCharWasPeriod := aStream peek = $..
			lastCharWasPeriod
				ifTrue: [ aStream next ] ].
	newVersion := self new: versionComponents size.
	1 to: versionComponents size do: [ :i | newVersion at: i put: (versionComponents at: i) ].
	^ newVersion
]
