tests
testColor
	self 
		assert: (self serialize: Color red) 
		equals: 'Color[#red]'.
	self 
		assert: (self serialize: (Color red copy setAlpha: 0.4)) 
		equals: 'Color{#red:1.0,#green:0.0,#blue:0.0,#alpha:0.4}'.
	self 
		assert: (self serialize: Color red lighter lighter) 
		equals: 'Color{#red:1.0,#green:0.06060606060606061,#blue:0.06060606060606061,#alpha:1.0}'.
