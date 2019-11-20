tests
testFloats
	| floats serialization materialization |
	floats := STON listClass withAll: ((-10 to: 10) collect: [ :each | each * Float pi ]).
	serialization := self serialize: floats.
	materialization := self materialize: serialization.
	self assert: floats size equals: materialization size.
	floats with: materialization do: [ :float :materializedFloat |
		"Use #closeTo: instead of #= to increase portability"
		self assert: float closeTo: materializedFloat ]