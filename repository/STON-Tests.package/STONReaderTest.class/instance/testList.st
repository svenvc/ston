tests
testList
	self assert: STON listClass equals: Array.
	self assert: (self materialize: '[1,2,3]') equals: (STON listClass with: 1 with: 2 with: 3).
	self assert: (self materialize: '[]') equals: STON listClass new