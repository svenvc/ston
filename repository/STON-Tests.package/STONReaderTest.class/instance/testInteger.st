tests
testInteger
	self assert: (self materialize: '1') equals: 1.
	self assert: (self materialize: '-1') equals: -1.
	self assert: (self materialize: '0') equals: 0.
	self assert: (self materialize: '1234567890') equals: 1234567890.
	self assert: (self materialize: '-1234567890') equals: -1234567890