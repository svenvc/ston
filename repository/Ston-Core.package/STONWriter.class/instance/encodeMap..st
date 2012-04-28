writing
encodeMap: pairs
	| first |
	first := true.
	writeStream nextPut: ${.
	self indentedDo: [
		self newlineIndent.
		pairs keysAndValuesDo: [ :key :value |
			first 
				ifTrue: [ first := false ] 
				ifFalse: [ self mapElementSeparator ].
			self encodeKey: key value: value ] ].
	self newlineIndent.
	writeStream nextPut: $}