convencience
toStringPretty: object
	"Return a String with the pretty printed STON serialization of object"

	"STON toStringPretty: (0@0 extent: 20@30)"
	
	^ String streamContents: [ :stream |
			self put: object onStreamPretty: stream ]