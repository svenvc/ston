tests
testAssociation
	self assert: (self serialize: 'foo' -> 1) equals: '''foo'':1'.
	self assert: (self serialize: #bar -> 2) equals: '#bar:2'.
	self assert: (self serialize: 'foo bar' -> #ok) equals: '''foo bar'':#ok'.
	self assert: (self serialize: 123 -> 456) equals: '123:456'
