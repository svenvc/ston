tests
testAlternativeRepresentation
	| testObject resultObject |
	testObject := STONAlternativeRepresentationTestObject example.
	"See the class comment of STONAlternativeRepresentationTestObject
	for a description of how the internal and external representation differ.
	See also STONAlternativeRepresentationTestObject>>#stonOn:
	and STONAlternativeRepresentationTestObject>>#fromSton:"
	resultObject := self materialize: (self serialize: testObject).
	self assert: resultObject id equals: testObject id.
	self assert: resultObject time equals: testObject time.
	self assert: resultObject gridReference closeTo: testObject gridReference.