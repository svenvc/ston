tests
testDiskFile
	self assert: (self serialize: 'foo.txt' asFileReference) equals: 'FILE[''foo.txt'']'.
	self assert: (self serialize: '/tmp/foo.txt' asFileReference) equals: 'FILE[''/tmp/foo.txt'']'.
	self assert: (self serialize: 'tmp/foo.txt' asFileReference) equals: 'FILE[''tmp/foo.txt'']'.
	self assert: (self serialize: '/tmp' asFileReference) equals: 'FILE[''/tmp'']'.
	self assert: (self serialize: '/tmp/' asFileReference) equals: 'FILE[''/tmp'']'