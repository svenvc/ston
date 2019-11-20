tests
testWideSymbol
	self assert: (self materialize: '#''яблоко''') identicalTo: #яблоко.
	self assert: (self materialize: '#яблоко') identicalTo: #яблоко