writing
writeObject: anObject do: block
	(jsonMode and: [ anObject class ~= STON listClass and: [ anObject class ~= STON mapClass ] ])
		ifTrue: [ self error: 'wrong object class for JSON mode' ].
	self with: anObject do: [
		"although there is no check here, class names are expected to conform
		to first STONReader>>#isClassStartChar: then STONReader>>#isClassChar:"
		writeStream nextPutAll: anObject class stonName.
		self prettyPrintSpace.
		block value ]