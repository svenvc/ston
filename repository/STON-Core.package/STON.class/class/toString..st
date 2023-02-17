convencience
toString: object
	"Return a String with the STON serialization of object"

	"(STON toString: 1@2) >>> 'Point[1,2]'"

	^ String streamContents: [ :stream |
			self put: object onStream: stream ]