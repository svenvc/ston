tests
testFloats
	| check |

	check := [ :numbers | | floats serialization materialization |
		floats := STON listClass withAll: numbers.
		serialization := self serialize: floats.
		materialization := self materialize: serialization.
		self assert: floats size equals: materialization size.
		floats with: materialization do: [ :float :materializedFloat |
			self assert: float equals: materializedFloat ] ].

	check value: ((-10 to: 10) collect: [ :each | each * Float pi ]).

	check value: {
		0.022999999999999854 . 4.999999999999996 . -4.999999999999996 . 0.333333333333 .
		Float zero . Float negativeZero .
		Float fmin . Float fmax .
		Float pi . Float e . 0.00001.
		Float infinity . Float negativeInfinity }.

	self assert: (STON fromString: (STON toString: Float nan)) isNaN