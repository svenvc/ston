tests
testList
	| string |
	self assert: (self materialize: '[1,2,3]') = #(1 2 3).
	self assert: (self materialize: '[]') = #()