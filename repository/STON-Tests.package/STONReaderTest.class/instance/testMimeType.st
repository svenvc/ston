tests
testMimeType
	self
		assert: (self materialize: 'MimeType[''application/json'']')
		equals: ZnMimeType applicationJson.
	self
		assert: (self materialize: 'MimeType[''text/plain;charset=utf-8'']')
		equals: ZnMimeType textPlain