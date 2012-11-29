initialize-release
initialize
	super initialize.
	objects := IdentityDictionary new.
	classes := IdentityDictionary new.
	allowComplexMapKeys := false.
	stack := Stack new.
	unresolvedReferences := 0