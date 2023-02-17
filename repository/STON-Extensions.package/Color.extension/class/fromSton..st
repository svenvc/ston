*STON-Extensions
fromSton: stonReader
	| representation |
	representation := stonReader parseMapOrListRepresentation.
	^ representation isArray
		ifTrue: [
			self named: representation first ]
		ifFalse: [
			(representation includesKey: #rgb)
				ifTrue: [
					self basicNew setRGB: (representation at: #rgb); setAlpha: 1.0 "backwards compatibility" ]
				ifFalse: [
					self
						r: (representation at: #red)
						g: (representation at: #green)
						b: (representation at: #blue)
						alpha: (representation at: #alpha) ] ]