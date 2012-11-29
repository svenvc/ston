initialize-release
optimizeForLargeStructures
	objects := (self class environment at: #FLLargeIdentityDictionary) new.
	stack := (self class environment at: #FLSimpleStack) new.