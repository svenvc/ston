tests
testBoolean
	self assert: (self materialize: 'true') = true.
	self assert: (self materialize: 'false') = false