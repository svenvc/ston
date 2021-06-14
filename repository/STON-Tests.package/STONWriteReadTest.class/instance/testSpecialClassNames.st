tests
testSpecialClassNames
	| specialClass key specialInstance ston reader object |
	specialClass := LookupKey newAnonymousSubclass.
	specialClass setName: #'STONTest_Lärm'.
	key := 999 atRandom asString asSymbol.
	specialInstance := specialClass key: key.
	ston := self serialize: specialInstance.
	reader := self reader: ston.
	(reader instVarNamed: #classes) 
		at: specialClass name 
		put: specialClass.
	object := reader next.
	self assert: object equals: specialInstance.
	self assert: object class equals: specialClass.
	self assert: object key equals: key