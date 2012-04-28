tests
testFloats
	| floats |
	floats := STON listClass withAll: ((-10 to: 10) collect: [ :each | each * Float pi ]).
	self serializeAndMaterialize: floats