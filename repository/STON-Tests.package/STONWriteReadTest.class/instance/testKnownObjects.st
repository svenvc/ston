tests
testKnownObjects
	| knownObject ston object |
	knownObject := STONTestKnownObject new.
	"make sure the system of remembering instances works"
	self assert: (STONTestKnownObject fromId: knownObject id asString) equals: knownObject.
	self assert: (STONTestKnownObject fromId: knownObject id asString) == knownObject.
	"only the id string is serialized"
	ston := self serialize: knownObject.
	"upon serialization, objects with known id strings come from the remembered instances"
	object := self materialize: ston.
	self assert: object equals: knownObject.
	self assert: object == knownObject.
	"not just the id is equal, but the rest of the object too"
	self assert: object description equals: knownObject description.
	
	STONTestKnownObject resetKnownObjects.