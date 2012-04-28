parsing-internal
parseNumber
	| negated number |
	negated := readStream peek = $-.
	negated ifTrue: [ readStream next ].
	number := self parseNumberInteger.
	(readStream peek = $.) ifTrue: [
		readStream next. 
		number := number + self parseNumberFraction ].
	(readStream peek = $e or: [ readStream peek = $E ]) ifTrue: [
		readStream next.
		number := number * self parseNumberExponent ].
	negated ifTrue: [ number := number negated ].
	self consumeWhitespace.
	^ number