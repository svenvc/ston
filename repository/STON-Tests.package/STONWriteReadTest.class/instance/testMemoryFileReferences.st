tests
testMemoryFileReferences
	| root dir1 file1 references ston result |
	root := FileSystem memory root.
	dir1 := (root / 'dir1') ensureCreateDirectory.
	file1 := (dir1 / 'file1') ensureCreateFile.
	file1 writeStreamDo: [ :out | out nextPutAll: 'ABC' ].
	references := STON listClass withAll: { dir1 . file1 }.
	ston := self serialize: references.
	result := self materialize: ston.
	self assert: result first exists.
	self assert: result second exists.
	self assert: result first fileSystem equals: result second fileSystem.
	self assert: result first fileSystem identicalTo: result second fileSystem.
	self assert: result first fileSystem isMemoryFileSystem.
	self assert: result second contents equals: 'ABC'