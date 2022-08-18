tests
testMapClass
	self assert: (STON fromString: '{ #foo : 1 , #bar : 2 }') class equals: STON mapClass