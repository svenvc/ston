parsing-internal
parseStringInternal
	| result delimiter |
	delimiter := readStream next.
	(delimiter = $' or: [ delimiter = $" ]) 
		ifFalse: [ self error: ''' or " expected' ].
	result := self stringStreamContents: [ :stream |
	[ readStream atEnd or: [ readStream peek = delimiter ] ] 
		whileFalse: [ stream nextPut: self parseCharacter ] ].
	self expectChar: delimiter.
	^ result