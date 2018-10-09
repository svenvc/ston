tests
testFraction
	self assert: (self materialize: '1/3') equals: 1/3.
	self assert: (self materialize: '-1/3') equals: -1/3.
	self assert: (self materialize: '100/11') equals: 100/11.
