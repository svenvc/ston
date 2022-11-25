initialization
close
	readStream ifNotNil: [
		readStream close.
		readStream := nil ]