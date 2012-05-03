tests
testFloats
	| floats serialization materialization |
	floats := STON listClass withAll: ((-10 to: 10) collect: [ :each | each * Float pi ]).
	serialization := String streamContents: [ :stream |
		(STONWriter on: stream) nextPut: floats ].
	materialization := (STONReader on: serialization readStream) next.
	self assert: floats size = materialization size.
	1 to: floats size do: [:index | | float |
		float := floats at: index.
		self assert: (float closeTo: (materialization at: index)) ].