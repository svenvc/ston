tests
testSmallDictionary
	"SmallDictionary is special because it does not inherit from Dictionary.
	It might also not exist in some dialects, where this test could be skipped."
	
	| dictionaries |
	dictionaries := STON listClass withAll: {
		SmallDictionary new at: 1 put: 1; at: 2 put: 2; yourself.
		SmallIdentityDictionary new at: 1 put: 1; at: 2 put: 2; yourself.
		SmallDictionary new }.
	self serializeAndMaterialize: dictionaries