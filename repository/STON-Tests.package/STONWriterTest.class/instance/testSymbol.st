tests
testSymbol
	self assert: (self serialize: #foo) equals: '#foo'.
	self assert: (self serialize: #FOO) equals: '#FOO'.
	self assert: (self serialize: #bytes) equals: '#bytes'.
	self assert: (self serialize: #'foo.bar') equals: '#foo.bar'.
	self assert: (self serialize: #'foo-bar') equals: '#foo-bar'.
	self assert: (self serialize: #'foo_bar') equals: '#foo_bar'.
	self assert: (self serialize: #'foo/bar') equals: '#foo/bar'.
	self assert: (self serialize: #'foo bar') equals: '#''foo bar'''.
	self assert: (self serialize: #foo123) equals: '#foo123'.