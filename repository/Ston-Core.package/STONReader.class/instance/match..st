private
match: aString
	"Tries to match aString, consume input and answer true if successful."
	
	| position |
	position := readStream position.
	aString do: [ :each |
		(readStream atEnd or: [ readStream next ~= each ]) ifTrue: [ 
			readStream position: position.
			^ false ] ].
	self consumeWhitespace.
	^ true