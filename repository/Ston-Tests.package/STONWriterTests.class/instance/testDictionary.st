tests
testDictionary
	| collection |
	collection := Dictionary new at: 1 put: 1; at: 2 put: 2; yourself.
	self assert: (self serialize: collection) = '{1:1,2:2}'.
	self assert: (self serialize: Dictionary new) = '{}'.