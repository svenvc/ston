tests
testFloats
	| floats serialization materialization |
	floats := STON listClass withAll: ((-10 to: 10) collect: [ :each | each * Float pi ]).
	"some problematic values:"
	floats := floats , { 0.022999999999999854 . 4.999999999999996 . -4.999999999999996 . Float epsilon . Float fmin . -0.0 }.
	serialization := self serialize: floats.
	materialization := self materialize: serialization.
	self assert: floats size equals: materialization size.
	floats with: materialization do: [ :float :materializedFloat |
		self assert: float equals: materializedFloat ]