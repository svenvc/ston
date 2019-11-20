tests
testOrderedDictionary
	| odictClass odict json dict |
	
	odictClass := self environment at: #OrderedDictionary ifAbsent: [ ^ self skip ].
		
	odict := odictClass newFrom: { 
		'a' -> 42 . 'b' -> 1. 'aa' -> 4. 'c' -> 23 
	}.
	
	"assert that the order is not equal in the dictionary hash table".	
	self 
		assertCollection: odict asArray hasSameElements: odict dictionary asArray;
		deny: odict asArray equals: odict dictionary asArray.
		
	"ordered presevered when encoding:"
	json := STONJSON toString: odict.
	self assert: json equals: '{"a":42,"b":1,"aa":4,"c":23}'.
	
	"lost when decoding"
	dict := STONJSON fromString: json.

	self 
		assertCollection: dict asArray hasSameElements: odict asArray;
		assert: dict equals: odict dictionary;
		deny: dict asArray equals: odict asArray
