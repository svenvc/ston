parsing
parseMapOrListRepresentation
	"Parse either a map or list to be used as a representation, not considering it as a referenceable object"
	readStream atEnd
		ifFalse: [
			readStream peek = ${
				ifTrue: [ | map |
					map := STON mapClass new.
					self parseMapDo: [ :key :value |
						map at: key put: value ].
					^ map ].
			readStream peek = $[
				ifTrue: [
					^ STON listClass streamContents: [ :stream |
						self parseListDo: [ :each | stream nextPut: each ] ] ] ].
	self error: 'invalid input'