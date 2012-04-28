parsing
parseMapDo: block
	self expect: '{'.
	(self match: '}')
		ifTrue: [ ^ self ].
	[ readStream atEnd ] whileFalse: [ | name value |
		name := self parseValue.
		(name isString or: [ name isNumber ])
			ifFalse: [ self error: 'unexpected property name type' ].
		self consumeWhitespace; expect: ':'.
		value := self parseValue.
		block value: name value: value.
		(self match: '}') 
			ifTrue: [ ^ self ].
		self expect: ',' ].
	self error: 'end of map expected'