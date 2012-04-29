tests
testDictionary
	| collection |
	collection := Dictionary new at: 1 put: 1; at: 2 put: 2; yourself.
	self assert: (self materialize: '{1:1,2:2}') = collection.
	self assert: (self materialize: '{}') = Dictionary new.
