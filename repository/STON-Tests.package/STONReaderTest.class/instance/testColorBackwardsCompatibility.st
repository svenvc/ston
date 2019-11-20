tests
testColorBackwardsCompatibility
	"ensure the older Color representation still works"
	self 
		assert: (self materialize: 'Color{#rgb:1072693248}')
		equals: Color red.
	self 
		assert: (self materialize: 'Color{#rgb:1072693248}')
		equals: (self materialize: 'Color[#red]').