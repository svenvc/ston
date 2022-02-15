private
lookupClass: name
	"name is a symbol at this point"
	Smalltalk globals 
		at: name 
		ifPresent: [ :class | ^ class ].
	"note that classes is an identity dictionary"
	^ classes 
		at: name 
		ifAbsentPut: [
			Object allSubclasses 
				detect: [ :class | class isMeta not and: [ class stonName = name ]  ]
				ifNone: [ NotFound signalFor: name ] ]