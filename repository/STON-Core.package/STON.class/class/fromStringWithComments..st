convencience
fromStringWithComments: string
	"Parse and materialize the STON representation in string,
	skipping C-style comments"
	
	"(STON fromStringWithComments: 'Point[1,/*comment*/2]') >>> (1@2)"

	^ self fromStreamWithComments: string readStream