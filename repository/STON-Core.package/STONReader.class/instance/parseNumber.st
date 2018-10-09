parsing-internal
parseNumber
	| negated number |
	negated := readStream peekFor: $-.
	number := self parseNumberInteger.
	(readStream peekFor: $/)
		ifTrue: [ 
			number := Fraction numerator: number denominator: self parseNumberInteger.
			(readStream peekFor: $s)
				ifTrue: [ number := ScaledDecimal newFromNumber: number scale: self parseNumberInteger ] ]
		ifFalse: [ 
			(readStream peekFor: $.)
				ifTrue: [ number := number + self parseNumberFraction ].
			((readStream peekFor: $e) or: [ readStream peekFor: $E ])
				ifTrue: [ number := number * self parseNumberExponent ] ].
	negated
		ifTrue: [ number := number negated ].
	self consumeWhitespace.
	^ number