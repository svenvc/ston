writing
encodeList: elements
	writeStream nextPut: $[.
	self indentedDo: [
		self newlineIndent.
		elements 
			do: [ :each | self nextPut: each ]
			separatedBy: [ self listElementSeparator ] ].
	self newlineIndent.
	writeStream nextPut: $] 