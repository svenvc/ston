tests
testNull
	| serializer string |
	serializer := [ :object | 
		String streamContents: [ :stream |
			(STONWriter on: stream)
				jsonMode: true; 
				nextPut: object ] ].
	self assert: (serializer value: nil) equals: 'null'