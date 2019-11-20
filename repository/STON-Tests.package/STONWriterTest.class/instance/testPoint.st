tests
testPoint
	self assert: (self serialize: 1@2) equals: 'Point[1,2]'