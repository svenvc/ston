private
processSubObjectsOf: object
	object stonProcessSubObjects: [ :each |
		each isStonReference 
			ifTrue: [ 
				self resolveReference: each ]
			ifFalse: [
				self processSubObjectsOf: each. 
				each ] ]
