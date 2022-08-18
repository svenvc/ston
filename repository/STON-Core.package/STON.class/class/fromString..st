convencience
fromString: string
	"Parse and materialize the STON representation in string"
	
	"(STON fromString: 'Point[1,2]') >>> (1@2)"
	
	^ self fromStream: string readStream