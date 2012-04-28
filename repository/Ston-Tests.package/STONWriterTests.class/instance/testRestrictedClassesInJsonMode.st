tests
testRestrictedClassesInJsonMode
	| serializer string |
	serializer := [ :object | 
		String streamContents: [ :stream |
			(STONWriter on: stream)
				jsonMode: true; 
				nextPut: object ] ].
	self should: [ serializer value: 1@2 ] raise: STONWriterError.
	self should: [ serializer value: STONTestUser dummy ] raise: STONWriterError.
