tests
testString
	| string |
	self assert: (self serialize: 'foo') equals: '''foo'''.
	self assert: (self serialize: 'FOO') equals: '''FOO'''.
	self assert: (self serializeAsciiOnly: 'élève en Français') equals: '''\u00E9l\u00E8ve en Fran\u00E7ais'''.
	self assert: (self serialize: 'élève en Français') equals: '''élève en Français'''.
	string := String withAll: {$" . $' . $\ . $/ . Character tab . Character cr . Character lf . Character newPage . Character backspace}.
	self assert: (self serialize: string) equals: '''"\''\\/\t\r\n\f\b'''