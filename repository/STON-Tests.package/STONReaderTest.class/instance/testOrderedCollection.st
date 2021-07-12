tests
testOrderedCollection
	| collection |
	collection := OrderedCollection with: 1 with: 2 with: 3.
	self assert: (self materialize: 'OrderedCollection[1,2,3]') equals: collection.
	self assert: (self materialize: 'OrderedCollection[]') equals: OrderedCollection new