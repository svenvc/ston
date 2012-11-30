accessing
peek
	position > limit
		ifTrue: [ self nextBuffer ].
	^ position <= limit
		ifTrue: [ buffer at: position ]
		ifFalse: [ nil ]