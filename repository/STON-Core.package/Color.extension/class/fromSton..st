*ston-core
fromSton: stonReader
	| representation |
	representation := stonReader parseMapOrListRepresentation.
	^ representation isArray
		ifTrue: [ 
			self named: representation first ]
		ifFalse: [ 
			self 
				r: (representation at: #red) 
				g: (representation at: #green) 
				b: (representation at: #blue) 
				alpha: (representation at: #alpha) ]
	