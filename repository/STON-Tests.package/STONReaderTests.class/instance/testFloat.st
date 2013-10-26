tests
testFloat
	self assert: (self materialize: '1.5') = 1.5.
	self assert: (self materialize: '-1.5') = -1.5.
	self assert: (self materialize: '0.0') = 0.0.
	self assert: (Float pi closeTo: (self materialize: '3.14149')).
	self assert: (1/3 closeTo: (self materialize: '0.333333')).
	self assert: (self materialize: '1.0e100') = (10 raisedTo: 100) asFloat.
	self assert: (self materialize: '1.0e-100') = (10 raisedTo: -100) asFloat.
	self assert: (self materialize: '-1.0e-100') = (10 raisedTo: -100) asFloat negated.