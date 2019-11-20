tests
testAssociation
	self assert: (self materialize: '''foo'':1') equals: ('foo' -> 1).
	self assert: (self materialize: '#bar:2') equals: (#bar -> 2).
	self assert: (self materialize: '''foo bar'':#ok') equals: ('foo bar' -> #ok).
	self assert: (self materialize: '123:456') equals: (123 -> 456).
	
	self assert: (self materialize: '''foo'' : 1') equals: ('foo' -> 1).
	self assert: (self materialize: '#bar : 2') equals: (#bar -> 2).
	self assert: (self materialize: '''foo bar'' : #ok') equals: ('foo bar' -> #ok).
	self assert: (self materialize: '123 : -456') equals: (123 -> -456).
	
	self assert: (self materialize: '#foo : 1 : 2') equals: (#foo -> (1 -> 2))
