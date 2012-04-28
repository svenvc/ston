initialize-release
initialize
	super initialize.
	prettyPrint := false.
	level := 0.
	referencePolicy := #normal.
	jsonMode := false.
	objects := IdentityDictionary new