initialize-release
initialize
	super initialize.
	objects := IdentityDictionary new.
	classes := IdentityDictionary new.
	allowComplexMapKeys := false.
	unresolvedReferences := 0