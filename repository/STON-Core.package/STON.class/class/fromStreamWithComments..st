convencience
fromStreamWithComments: readStream
	"Parse and materialize the STON representation in the character readStream,
	skipping C-style comments"
	
	"(STON fromStreamWithComments: 'Point[1,/*comment*/2]' readStream) >>> (1@2)"

	^ (self reader on: (STONCStyleCommentsSkipStream on: readStream)) next