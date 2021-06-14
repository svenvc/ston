private
reader: string
	^ STON reader
		on: (STONCStyleCommentsSkipStream on: string readStream);
		yourself