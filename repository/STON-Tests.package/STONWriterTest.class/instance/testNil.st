tests
testNil
	self assert: (self serialize: nil) equals: 'nil'