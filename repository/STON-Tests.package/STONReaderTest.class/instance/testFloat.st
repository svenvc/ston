tests
testFloat
	self assert: ((self materialize: '1.5') closeTo: 1.5).
	self assert: ((self materialize: '-1.5') closeTo: -1.5).
	self assert: (self materialize: '0.0') isZero.
	self assert: (Float pi closeTo: (self materialize: '3.14149')).
	self assert: (1/3 closeTo: (self materialize: '0.333333')).
	self assert: (self materialize: '1.0e100') equals: 1.0e100.
	self assert: (self materialize: '1.0e-100') equals: 1.0e-100.
	self assert: (self materialize: '-1.0e-100') equals: -1.0e-100.
	self assert: (self materialize: 'Float[#nan]') isNaN.
	self assert: (self materialize: 'Float[#infinity]') equals: Float infinity.
	self assert: (self materialize: 'Float[#negativeInfinity]') equals: Float negativeInfinity.
	self assert: (Float pi closeTo: (self materialize: 'Float[3.14149]')).