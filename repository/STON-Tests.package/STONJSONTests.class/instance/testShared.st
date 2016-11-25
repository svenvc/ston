tests
testShared
	"Structure sharing cannot be encoded using JSON"
	self
		should: [ | foo |
			foo := { 'foo'->'dummy' } as: Dictionary.
			STONJSON toString: { foo. foo } ]
		raise: STONWriterError