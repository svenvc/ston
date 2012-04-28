private
serialize: anObject
	^ String streamContents: [ :stream |
		(STONWriter on: stream) nextPut: anObject ]