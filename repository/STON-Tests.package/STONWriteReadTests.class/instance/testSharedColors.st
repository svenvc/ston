tests
testSharedColors
	| color1 color2 colors |
	color1 := Color r: 0.25 g: 0.5 b: 0.75 alpha: 0.4.
	color2 := Color red.
	colors := STON listClass withAll: { color1. color2. color2 }.
	self serializeAndMaterialize: colors
