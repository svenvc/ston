tests
testBoolean
	self assert: (self serialize: true) equals: 'true'.
	self assert: (self serialize: false) equals: 'false'