accessing
next
	position > limit
		ifTrue: [ self nextBuffer ].
	^ position <= limit
		ifTrue: [ 
			| char |
			char := buffer at: position.
			position := position + 1.
			char ]
		ifFalse: [ nil ]