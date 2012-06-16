private
matchChar: character
	"Tries to match character, consume input and 
	answer true if successful and consumes whitespace at the end."
	
	^ readStream peek = character
		ifTrue: [
			readStream next.
			self consumeWhitespace.
			true ]
		ifFalse: [
			false ]