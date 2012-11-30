utilities
fastReadFromFileNamed: path
	^ path asFileReference
		readStreamDo: [ :stream | 
			STON reader
				on: (STONBufferedReadStream on: stream);
				optimizeForLargeStructures;
				next ]