tests
testCollectionsStructured
	| collections one two |
	one := 1@2.
	two := 2@3.
	collections := STON listClass withAll: {
	 	Bag withAll: { one. two. one. two. one }.
	 	Set withAll: { one. two. one. two. one }.
	 	OrderedCollection withAll: { one. two. one. two. one }.
	}.
	self serializeAndMaterialize: collections