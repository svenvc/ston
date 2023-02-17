tests
testBag
	self
		assert: (self serialize: (Bag withAll: #(a a)))
		equals: 'Bag{#a:2}'.
	self
		assert: (self serialize: Bag new)
		equals: 'Bag{}'