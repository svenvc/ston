tests
testInteger
	self assert: (self serialize: 1) equals: '1'.
	self assert: (self serialize: 0) equals: '0'.
	self assert: (self serialize: -1) equals: '-1'.
	self assert: (self serialize: 1234567890) equals: '1234567890'.
	self assert: (self serialize: -1234567890) equals: '-1234567890'