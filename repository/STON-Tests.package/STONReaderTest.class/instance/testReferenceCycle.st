tests
testReferenceCycle
	| array |
	array := (self materialize: '[1,@1]').
	self assert: array class equals: STON listClass.
	self assert: array size equals: 2.
	self assert: array first equals: 1.
	self assert: array second identicalTo: array