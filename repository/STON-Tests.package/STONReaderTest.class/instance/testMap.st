tests
testMap
	self
		assert: (self materialize: '{#foo:1}')
		equals:
			(STON mapClass new
				at: #foo put: 1;
				yourself).
	self assert: (self materialize: '{}') equals: STON mapClass new