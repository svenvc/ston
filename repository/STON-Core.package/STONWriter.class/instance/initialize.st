initialization
initialize
	super initialize.
	stonCharacters := STONCharacters.
	prettyPrint := false.
	newLine := OSPlatform current lineEnding.
	level := 0.
	referencePolicy := #normal.
	jsonMode := keepNewLines := asciiOnly := false.
	objects := IdentityDictionary new