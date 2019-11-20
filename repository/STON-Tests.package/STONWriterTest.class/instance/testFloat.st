tests
testFloat
	self assert: (self serialize: 1.5) equals: '1.5'.
	self assert: (self serialize: 0.0) equals: '0.0'.
	self assert: (self serialize: -1.5) equals: '-1.5'.
	self assert: ((self serialize: Float pi) beginsWith:  '3.14159').
	self assert: ((self serialize: (1/3) asFloat) beginsWith:  '0.333').
	self assert: (self serialize: (10 raisedTo: 100) asFloat) equals: '1.0e100'.
	self assert: (self serialize: (10 raisedTo: -50) asFloat) equals: '1.0e-50'.
	self assert: (self serialize: (10 raisedTo: -50) asFloat negated) equals: '-1.0e-50'.