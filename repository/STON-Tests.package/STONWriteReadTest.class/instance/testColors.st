tests
testColors
	| colors |
	colors := STON listClass withAll: { 
		Color red.
		Color red copy setAlpha: 0.4.
		Color red lighter lighter }.
	self serializeAndMaterialize: colors
