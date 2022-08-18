convencience
put: object onStreamPretty: writeStream
	"Write the pretty printed STON serialization of object to the character writeStream"

	"String streamContents: [ :out | STON put: (0@0 extent: 20@30) onStreamPretty: out ]"

	(self writer on: writeStream)
		prettyPrint: true; 
		nextPut: object