tests
testFraction
	self assert: (self serialize: 1/3) equals: '1/3'.
	self assert: (self serialize: -1/3) equals: '-1/3'.
	self assert: (self serialize: 10/100) equals: '1/10'.
	self assert: (self serialize: 100/10) equals: '10'.
	self assert: (self serialize: 123/123) equals: '1'.
	self assert: (self serialize: 100/11) equals: '100/11'.