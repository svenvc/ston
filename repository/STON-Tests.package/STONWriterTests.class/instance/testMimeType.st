tests
testMimeType
	self
		assert: (self serialize: ZnMimeType applicationJson)
		equals: 'MimeType[''application/json'']'.
	self
		assert: (self serialize: ZnMimeType textPlain)
		equals: 'MimeType[''text/plain;charset=utf-8'']'.