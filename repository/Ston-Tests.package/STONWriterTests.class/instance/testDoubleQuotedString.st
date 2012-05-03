tests
testDoubleQuotedString
	| serializer string |
	serializer := [ :object | 
		String streamContents: [ :stream |
			(STONWriter on: stream)
				jsonMode: true; 
				nextPut: object ] ].
	self assert: (serializer value: 'foo') = '"foo"'.
	self assert: (serializer value: 'FOO') = '"FOO"'.
	self assert: (serializer value: 'élève en Français') = '"\u00E9l\u00E8ve en Fran\u00E7ais"'.
	string := String withAll: { 
		$". $'. $\. Character tab. Character cr. Character lf.  Character newPage. Character backspace }.
	self assert: (serializer value: string) = '"\"\''\\\t\r\n\f\b"'.
