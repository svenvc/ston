tests
testScaledDecimals
	| fractions |
	fractions := STON listClass withAll: (-2/3s2 to: 2/3s2 by: 1/3s2).
	self serializeAndMaterialize: fractions