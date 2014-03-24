private
lookupClass: name
	Smalltalk globals 
		at: name 
		ifPresent: [ :class | ^ class ].
	^ classes 
		at: name 
		ifAbsentPut: [
			Object allSubclasses 
				detect: [ :class | class stonName == name ] 
				ifNone: [ self error: 'Cannot resolve class named ', name printString ] ]
	