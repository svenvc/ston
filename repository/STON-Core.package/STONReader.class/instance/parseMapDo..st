parsing
parseMapDo: block
	self expectChar: ${.
	(self matchChar: $})
		ifTrue: [ ^ self ].
	[ readStream atEnd ] whileFalse: [ | name value |
		name := self parseValue.
		(allowComplexMapKeys or: [ name isString or: [ name isNumber ] ])
			ifFalse: [ self error: 'unexpected property name type' ].
		self expectChar: $:.
		value := self parseValue.
		block value: name value: value.
		(self matchChar: $}) 
			ifTrue: [ ^ self ].
		self expectChar: $, ].
	self error: 'end of map expected'