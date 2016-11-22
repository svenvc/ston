*ston-core
stonName
	"Override to encode my instances using a different class name.
	I should return a Symbol. If a subclass return a String instead of a Symbol, the export will work but you will not be able to parse ston containing the class anymore."

	^ self name