private
processSubObjectsOf: object
	stack push: object.
	[ stack isEmpty ]
		whileFalse: [ 
			stack pop
				stonProcessSubObjects: [ :each | 
					each isStonReference
						ifTrue: [ self resolveReference: each ]
						ifFalse: [ stack push: each ] ] ]