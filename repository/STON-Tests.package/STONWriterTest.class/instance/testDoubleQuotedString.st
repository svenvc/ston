tests
testDoubleQuotedString
	| string |
	self assert: (self serializeJson: 'foo') equals: '"foo"'.
	self assert: (self serializeJson: 'FOO') equals: '"FOO"'.
	self assert: (self serializeJson: 'élève en Français') equals: '"élève en Français"'.
	string := String withAll: {$" . $' . $\ . $/ . Character tab . Character cr . Character lf . Character newPage . Character backspace}.
	"Note that in JSON mode, double quotes get escaped, and single quotes not"
	self assert: (self serializeJson: string) equals: '"\"''\\/\t\r\n\f\b"'