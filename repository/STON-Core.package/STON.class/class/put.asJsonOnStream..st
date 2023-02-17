convencience
put: object asJsonOnStream: writeStream
	"Write the JSON serialization of object to the character writeStream.
	Note that the object graph can only contain lists (Array) and maps (Dictionary)"

	"String streamContents: [ :out |
		STON put: { { #foo->1 } asDictionary. { #bar->2 } asDictionary } asJsonOnStream: out ]"

	(self jsonWriter on: writeStream) nextPut: object