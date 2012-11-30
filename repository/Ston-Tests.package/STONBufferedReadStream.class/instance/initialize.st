initialize-release
initialize
	super initialize.
	self sizeBuffer: (2 raisedToInteger: 16).
	position := 1.
	limit := 0