tests
testObject
	self assert: (self materialize: 'Point[1,2]') equals: (1@2).
	self assert: (self materialize: 'Point[1.5,-0.5]') equals: (1.5 @ -0.5).