parsing-internal
parseNumberExponent
	| number negated |
	number := 0.
	negated := readStream peek = $-.
	(negated or: [ readStream peek = $+ ]) ifTrue: [ readStream next ].
	[ readStream atEnd not and: [ readStream peek isDigit ] ] whileTrue: [ 
		number := 10 * number + readStream next digitValue ].
	negated ifTrue: [ number := number negated ].
	^ 10 raisedTo: number