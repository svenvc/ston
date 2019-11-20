tests
testByteArray
	self assert: (self serialize: #(1 2 3) asByteArray) equals: 'ByteArray[''010203'']' 
