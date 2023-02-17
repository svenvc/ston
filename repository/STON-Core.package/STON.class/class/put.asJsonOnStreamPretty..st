convencience
put: object asJsonOnStreamPretty: writeStream
	"Write the pretty printed JSON serialization of object to the character writeStream.
	Note that the object graph can only contain lists (Array) and maps (Dictionary)"

	"String streamContents: [ :out |
		STON put: { { #foo->1 } asDictionary. { #bar->2 } asDictionary } asJsonOnStreamPretty: out ]"

	(self jsonWriter on: writeStream)
		prettyPrint: true;
		nextPut: object