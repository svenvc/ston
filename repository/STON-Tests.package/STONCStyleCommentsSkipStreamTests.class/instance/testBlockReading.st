testing
testBlockReading
	| input buffer |
	input := STONCStyleCommentsSkipStream on: 'abc/*comment*/def' readStream.
	buffer := String new: 6.
	self assert: (input readInto: buffer startingAt: 1 count: 4) equals: 4.
	self assert: (buffer copyFrom: 1 to: 4) equals: 'abcd'.
	self assert: (input readInto: buffer startingAt: 5 count: 4) equals: 2.
	self assert: buffer equals: 'abcdef'.
	input := STONCStyleCommentsSkipStream on: 'abc//comment\def' withCRs readStream.
	buffer := String new: 6.
	self assert: (input readInto: buffer startingAt: 1 count: 6) equals: 6.
	self assert: buffer equals: 'abcdef'.
	self assert: input atEnd