tests
testSymbolAsString
	| serializer string |
	serializer := [ :object | 
		String streamContents: [ :stream |
			(STONWriter on: stream)
				jsonMode: true; 
				nextPut: object ] ].
	self assert: (serializer value: #foo) = '"foo"'.
	self assert: (serializer value: #'FOO') = '"FOO"'.
