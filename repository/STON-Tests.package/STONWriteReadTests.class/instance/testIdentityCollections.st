tests
testIdentityCollections
	| collections |
	collections := STON listClass withAll: {
		IdentitySet withAll: #(1 2 3).
		IdentityDictionary new at: 1 put: 1; at: 2 put: 2; yourself.
		IdentityBag withAll: { #A. #B. #A. #B. #A } }.
	self serializeAndMaterialize: collections