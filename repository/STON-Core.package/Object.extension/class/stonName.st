*ston-core
stonName
	"Override to encode my instances using a different class name.
	Use symbols as class name/tag."
	
	"Class names are expected to conform
	to first STONReader>>#isClassStartChar: then STONReader>>#isClassChar:"
	
	^ self name