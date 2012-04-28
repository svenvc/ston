tests
testMap
	| string |
	self assert: (self materialize: '{#foo:1}') = (Dictionary new at: #foo put: 1; yourself).
	self assert: (self materialize: '{}') = Dictionary new