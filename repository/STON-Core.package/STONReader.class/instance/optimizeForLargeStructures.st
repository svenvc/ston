initialize-release
optimizeForLargeStructures
	self class environment
		at: #FLLargeIdentityDictionary
		ifPresent: [ :identityDictionaryClass | objects := identityDictionaryClass new ].
	self class environment 
		at: #FLSimpleStackstack 
		ifPresent: [ :stackClass | stack := stackClass new ]