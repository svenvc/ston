private
lookupClass: name
	Smalltalk globals 
		at: name 
		ifPresent: [ :cls | ^ cls ].
	^ clses 
		at: name 
		ifAbsentPut: [
			Object allSubclses 
				detect: [ :cls | cls stonName == name ] 
				ifNone: [ self error: 'Cannot resolve cls named ', name printString ] ]
