convencience
put: object onStream: writeStream
	"Write the STON serialization of object to the character writeStream"

	"(String streamContents: [ :out | STON put: 1@2 onStream: out ]) >>> 'Point[1,2]'"

	"FileLocator temp / ('{1}.ston' format: { Time millisecondClockValue }) in: [ :file |
		file writeStreamDo: [ :out | STON put: 1@2 onStream: out ].
		file readStreamDo: [ :in | STON fromStream: in ] ]"

	(self writer on: writeStream) nextPut: object