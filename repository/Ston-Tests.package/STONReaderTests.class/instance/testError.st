tests
testError
	self should: [ STON fromString: 'foo' ] raise: STONReaderError.
	self should: [ STON fromString: '{foo:}' ] raise: STONReaderError.
	self should: [ STON fromString: '{foo,}' ] raise: STONReaderError.
	self should: [ STON fromString: '[1,]' ] raise: STONReaderError.
	self should: [ STON fromString: '+1' ] raise: STONReaderError.
	self should: [ STON fromString: ']' ] raise: STONReaderError.
	self should: [ STON fromString: '#' ] raise: STONReaderError