private
processSubObjectsOf: object
	stack push: object.
	[ stack isEmpty ]
		whileFalse: [ 
			stack pop
				stonProcessSubObjects: [ :each | 
					each isStonReference
						ifTrue: [ self resolveReference: each ]
						ifFalse: [ 
							each stonContainSubObjects
								ifTrue: [ stack push: each ]
								ifFalse: [ each ] ] ] ]