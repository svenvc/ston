parsing-internal
parseNumberFraction
	| number power |
	number := 0.
	power := 1.
	[ readStream atEnd not and: [ readStream peek isDigit ] ] whileTrue: [
		number := 10 * number + readStream next digitValue.
		power := power * 10 ].
	^ number / power