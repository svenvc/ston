tests
testBag
	self 
		assert: (self materialize: 'Bag{#a:2,#b:3}') 
		equals: (Bag withAll: #(a a b b b)).
	self 
		assert: (self materialize: 'Bag{}') 
		equals: Bag new.
