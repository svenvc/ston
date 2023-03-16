convencience
toJsonString: object
	"Return a String with the JSON serialization of object.
	Note that the object graph can only contain lists (Array) and maps (Dictionary)"

	"(STON toJsonString: { { #foo->1 } asDictionary. { #bar->2 } asDictionary }) >>> '[{""foo"":1},{""bar"":2}]'"

	^ String streamContents: [ :stream |
			self put: object asJsonOnStream: stream ]