initalize
initialize
	super initialize.
	self id: UUID new.
	self class addKnownObject: self