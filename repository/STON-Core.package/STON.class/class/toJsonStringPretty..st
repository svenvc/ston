convencience
toJsonStringPretty: object
	"Return a String with the pretty printed JSON serialization of object.
	Note that the object graph can only contain lists (Array) and maps (Dictionary)"

	"STON toJsonStringPretty: { { #foo->1 } asDictionary. { #bar->2 } asDictionary }"

	^ String streamContents: [ :stream |
			self put: object asJsonOnStreamPretty: stream ]