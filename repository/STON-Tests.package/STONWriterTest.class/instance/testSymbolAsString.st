tests
testSymbolAsString
	self assert: (self serializeJson: #foo) equals: '"foo"'.
	self assert: (self serializeJson: #FOO) equals: '"FOO"'