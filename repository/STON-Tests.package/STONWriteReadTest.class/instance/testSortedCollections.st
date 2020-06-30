tests
testSortedCollections
	| collections |
	collections := STON listClass withAll: {
		SortedCollection new.
		SortedCollection new: 0.
		#(5 3 7 2 1 4 10 9 8 6) asSortedCollection.
		#(5 3 7 2 1 4 10 9 8 6) asSortedCollection: #yourself ascending.
		#(5 3 7 2 1 4 10 9 8 6) asSortedCollection: #yourself descending.
		#('****' '*' '*****' '**' '***') asSortedCollection: #size ascending.
		#('****' '*' '*****' '**' '***') asSortedCollection: #size descending.
		#(5 3 7 2 1 4 10 nil 9 8 6) asSortedCollection: #yourself ascending undefinedFirst.
		#(5 3 7 2 1 4 10 nil 9 8 6) asSortedCollection: #yourself ascending reversed undefinedLast }.
	self serializeAndMaterialize: collections