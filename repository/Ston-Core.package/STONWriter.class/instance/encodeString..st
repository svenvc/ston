private
encodeString: string
	writeStream nextPut: (jsonMode ifTrue: [ $" ] ifFalse: [ $' ]).
	string do: [ :each |
		self encodeCharacter: each ].
	writeStream nextPut: (jsonMode ifTrue: [ $" ] ifFalse: [ $' ]).