tests
testDiskFiles
	| diskFiles |
	diskFiles := STON listClass withAll: { 
		FileLocator image asFileReference.
		FileLocator workingDirectory asAbsolute.
		'foo/bar/readme.txt' asFileReference.
		'./readme.txt' asFileReference.
		(FileLocator home / 'foo.txt') asFileReference }.
	self serializeAndMaterialize: diskFiles