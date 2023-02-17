tests
testFileReferenceBackwardsCompatibility
	"we now have FILE, make sure that we support the old generic format"
	| fs |
	fs := STON toString: FileSystem disk.
	self
		assert: (self materialize: 'FileReference{#path:RelativePath[],#filesystem:', fs, '}')
		equals: FileLocator workingDirectory.
	self
		assert: (self materialize: 'FileReference{#path:RelativePath[],#filesystem:', fs, '}')
		equals: (self materialize: 'FILE[''.'']').
	self
		assert: (self materialize: 'FileReference{#path:AbsolutePath[''tmp'',''foo.txt''],#filesystem:', fs, '}')
		equals: '/tmp/foo.txt' asFileReference.
	self
		assert: (self materialize: 'FileReference{#path:AbsolutePath[''tmp'',''foo.txt''],#filesystem:', fs, '}')
		equals: (self materialize: 'FILE[''/tmp/foo.txt'']')