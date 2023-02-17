instance creation
fromId: idString
	"Given id, return a matching instance of me, either by returning an existing known instance or by creating a new one (that is automatically added to the known instances)"

	| uuid |
	uuid := UUID fromString: idString.
	^ self knownObjects
		detect: [ :each | each id = uuid ]
		ifNone: [ self new id: uuid ]