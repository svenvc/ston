tests
testSymbol
	self assert: (self materialize: '#''foo''') identicalTo: #foo.
	self assert: (self materialize: '#foo') identicalTo: #foo