tests
testMetaclass
	self assert: (self serialize: Point class) equals: 'Metaclass[#Point]'