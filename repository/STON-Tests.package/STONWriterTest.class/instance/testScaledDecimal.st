tests
testScaledDecimal
	self assert: (self serialize: 1/3s2) equals: '1/3s2'.
	self assert: (self serialize: -1/3s2) equals: '-1/3s2'.
	self assert: (self serialize: 1/3s10) equals: '1/3s10'.
	self assert: (self serialize: -1/3s10) equals: '-1/3s10'