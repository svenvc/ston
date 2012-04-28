tests
testIsSimpleSymbol
	self assert: (STONWriter new isSimpleSymbol: #foo).
	self assert: (STONWriter new isSimpleSymbol: #az).
	self assert: (STONWriter new isSimpleSymbol: #AZ).
	self assert: (STONWriter new isSimpleSymbol: #N0123456789).
	self assert: (STONWriter new isSimpleSymbol: #foo123).
	self assert: (STONWriter new isSimpleSymbol: #'Foo/Bar').
	self assert: (STONWriter new isSimpleSymbol: #'Foo.Bar').
	self assert: (STONWriter new isSimpleSymbol: #'Foo-Bar').
	self assert: (STONWriter new isSimpleSymbol: #'Foo_Bar').
	self assert: (STONWriter new isSimpleSymbol: #foo).
	self deny: (STONWriter new isSimpleSymbol: #'#^&$%')