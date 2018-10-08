comparing
= object
	self class == object class ifFalse: [ ^ false ].
	^ self id = object id