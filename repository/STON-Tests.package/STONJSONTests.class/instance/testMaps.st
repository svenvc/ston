tests
testMaps
	self assert: (STONJSON toString: ({ 'temperature'->37 } as: Dictionary)) equals: '{"temperature":37}'.
	self assert: (STONJSON toString: Dictionary new) equals: '{}'.
	self assert: (STONJSON fromString: '{"temperature":37}') equals: ({ 'temperature'->37 } as: Dictionary).
	self assert: (STONJSON fromString: '{}') equals: Dictionary new.