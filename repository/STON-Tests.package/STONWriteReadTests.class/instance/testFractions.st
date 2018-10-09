tests
testFractions
	| fractions |
	fractions := STON listClass withAll: (-2/3 to: 2/3 by: 1/3).
	self serializeAndMaterialize: fractions