accessing
knownObjects
	^ KnownObjects ifNil: [ KnownObjects := OrderedCollection new ]