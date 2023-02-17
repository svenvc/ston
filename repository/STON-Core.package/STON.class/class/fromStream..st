convencience
fromStream: readStream
	"Parse and materialize the STON representation in the character readStream"

	"(STON fromStream: 'Point[1,2]' readStream) >>> (1@2)"

	"FileLocator temp / ('{1}.ston' format: { Time millisecondClockValue }) in: [ :file |
		file writeStreamDo: [ :out | STON put: 1@2 onStream: out ].
		file readStreamDo: [ :in | STON fromStream: in ] ]"

	^ (self reader on: readStream) next