parsing
parseListDo: block
	| index |
	self expect: '['.
	(self match: ']') 
		ifTrue: [ ^ self ].
	index := 1.
	[ readStream atEnd ] whileFalse: [
		block cull: self parseValue cull: index.
		(self match: ']') 
			ifTrue: [ ^ self ].
		index := index + 1.
		self expect: ',' ].
	self error: 'end of list expected'