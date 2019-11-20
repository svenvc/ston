tests
testPrettyPrinting
	| object |
	object := STONTestUser dummy.
	self assert: (STON fromString: (STON toStringPretty: object)) equals: object.
	object := STONTestDomainObject dummy.
	self assert: (STON fromString: (STON toStringPretty: object)) equals: object