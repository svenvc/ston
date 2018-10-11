tests
testDiskFile
	self assert: (self materialize: 'FILE[''foo.txt'']') equals: 'foo.txt' asFileReference.
	self assert: (self materialize: 'FILE[''/tmp/foo.txt'']') equals: '/tmp/foo.txt' asFileReference.
	self assert: (self materialize: 'FILE[''tmp/foo.txt'']') equals: 'tmp/foo.txt' asFileReference.
	self assert: (self materialize: 'FILE[''/tmp'']') equals: '/tmp' asFileReference.